pipeline {
    agent any
    stages {
        stage('Select Environment') {
            steps {
                script {
                    def userInput = input(
                        message: 'Choose deployment settings',
                        parameters: [
                            choice(
                                name: 'ENV',
                                choices: ['dev', 'staging', 'prod'],
                                description: 'Target environment'
                            ),
                            booleanParam(
                                name: 'RUN_MIGRATION',
                                defaultValue: false,
                                description: 'Run DB migration?'
                            )
                        ]
                    )

                    env.TARGET_ENV = userInput.ENV
                    env.RUN_MIGRATION = userInput.RUN_MIGRATION.toString()
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying to ${env.TARGET_ENV}"
                echo "Run migration: ${env.RUN_MIGRATION}"
            }
        }
    }
}

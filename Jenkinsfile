pipeline {
	agent any
	stages {
		stage('Checkout') {
			steps {
				echo 'TODO: зберегти код застосунку'
			}		
		}
		stage('Lint') {
			steps {
				echo 'TODO: лінгинг коду'
			}
		}
		stage('Test') {
			steps {
				echo 'TODO: юніт-тести'
			}
		}
		stage('Build') {
            		steps {
                		echo 'TODO: docker build образа приложения'
            		}
        	}
        	stage('Deploy') {
            		steps {
				echo 'TODO: docker compose up -d'
            		}
        	}
        	stage('Smoke') {
            		steps {
                		echo 'TODO: curl — проверить, что сайт живой'
            		}
        	}
	}
	
	post {
		success { echo 'Pipeline completed successfully' }
		failure { echo 'Pipeline ended with error' }
	}
}

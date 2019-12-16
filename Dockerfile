#!groovy
pipeline {
     agent any 
    parameters {
        choice(choices: ['US-EAST-1', 'US-WEST-2'], description: 'What's your region?', name: 'region')
    }
     stages {
         stage ('Destroy') {
             steps {
                 build job : 'job1',	parameters:
                 [
			           [
			               $class: 'StringParameterValue', 
			               name: 'action',
			               value: "DESTROY"
			               ],
                       [ $class: 'StringParameterValue', name: 'env', value: "1231" ]
                 ]  
             }
         }
       stage ('Creation') {
             steps {
                 build job : 'job2',	parameters:
                 [
			        [$class: 'StringParameterValue', name: 'action', value: "CREATED" ],
                    [ $class: 'StringParameterValue', name: 'env', value: "1232" ]
                 ]  
             }
         }
       stage ('Updation') {
             steps {
                    sh "echo ${params.region}"
             }
         }
     }
   }

pipeline {
    stages {
        stage("Checkout") {
            steps {
                checkout([$class: 'GitSCM',
                      branches: [[name: '*/master']],
                      doGenerateSubmoduleConfigurations: false,
                      extensions: [[$class: 'SubmoduleOption',
                                    disableSubmodules: false,
                                    parentCredentials: false,
                                    recursiveSubmodules: true,
                                    reference: '',
                                    trackingSubmodules: false]],
                      submoduleCfg: [],
                      userRemoteConfigs: [[url: 'git@github.com:Web-tree/entrypoint.git']]])
            }
        }

        stage("build webtree.org landing") {
            agent {
                docker {
                    image 'node:6-alpine'
                    args '-p 3000:3000'
                }
            }

            steps {
                dir("www/webtree") {
                    sh 'npm set progress=false && npm config set depth 0'
                    sh 'npm config set registry http://registry.npmjs.org/'
                    sh 'npm i'
                    sh '$(npm bin)/ng build --prod --build-optimizer'
                }
            }
        }

        stage("build & push image") {
            steps {
                def image = docker.build("webtree/entrypoint:${env.BUILD_ID}")
                image.push('latest')
            }
        }

    }
}
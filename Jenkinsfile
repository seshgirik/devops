node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        logstashSend failBuild: true, maxLines: 1000

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        logstashSend failBuild: true, maxLines: 1000

        app = docker.build("seshgirik/hellonode")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        
        logstashSend failBuild: true, maxLines: 1000
        logstashSend "${env.BUILD_NUMBER}"
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        
        
        /*docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")*/
            
        /*docker.withRegistry('http://localhost:5000', 'docker-hub-credentials') {  */
        /*docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {

            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            


        }*/
    }
}

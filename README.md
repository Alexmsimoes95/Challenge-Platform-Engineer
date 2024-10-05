# Challenge-de-Platform-Engineer---XpandIT

This repository provides the steps to run a Tomcat 10.1.28 on a OracleLinux 9 using Docker.

## Prerequisites

- Docker installed on your machine. You can download it from Docker's official website.

## Steps to Reproduce

**Clone the Repository**
- You can download the content using HTTPS or ssh. If you opt for downloading using ssh, you should have git installed on your machine and can clone the repository by running the following command:
   
   `git clone https://github.com/Alexmsimoes95/Challenge-de-Platform-Engineer-XpandIT.git`
- To dockarize the application correctly you should place inside the repository created folder "Challenge-Platform-Engineer".

**Generate the CA certificates**
- Inside the project folder run the command `./self-signer.sh` it will generate the CA certificate for further sign the tomcat certificate.

**Build the Docker Image**
- After CA certificate generate, you should build the image, using the following command `docker build -t <app_free-name_choosed> .`

**Deploy the Builded Image**
- After build completion at top (after the writed command) you will see the **FINISHED** work. After that you should deploy the image to make the sample application online, for that you should use the command `docker run -d -p 4041:4041 <name_choosed_on_build>`

**Validation of deploy**
- After runned the last command you should run the command `docker ps` to see if the image you deployed is running without issues.
- After checked on shell, go to the web browser and run the link [https://localhost:4041/challenge](https://localhost:4041/challenge) .
- When it loads you are advised about the security of the website, since the certificates used are self-sign generated and for testing proposes you should press "Advanced..." and accept to proceed to the website.

**ADVISE**
- If you get trouble or errors when try to run the commands you should check if your user has root permissions and append `sudo` at the start of each docker command.
- When you go run the `self-signer.sh`, before running it check if the permissions of the file persist as rwx, if not you could run the command `chmod u+x self-signer.sh` and next can run it whitout any issues.

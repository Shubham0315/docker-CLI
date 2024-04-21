Docker's most attractive feature is to be able to push images to container image registeries.

-------------------------
Container Image Registry
-------------------------
- A place for storing and tracking container images.
- Container images are tracked by their tags (string with image name and version)
- Images with no version gets automatically tagged to version called _**Latest**_. This naming scheme makes easier to download specific versions of images.

  _** Docker HUB**_
  - Default registry used by docker client
  - Public registry that anyone can push images to.
  - Whenever our dockerfile needs images, it pulls images from Docker Hub from the FROM section
 
  To login Docker Hub using CLI
  Command :- _**docker login**_  (If asked for credentials, provide them)
  <img width="765" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/e94b5742-7c23-4ed4-b5cb-d0e583403b6e">

  Now, lets push image to dockerhub. For that we need to tell docker that image is to be pushed into a registry.
  To do that we need to rename the image.

  Rename is done using "tag" option (just like mv. It must contain our username
  
  _**Command :- docker tag my-web-server shubham315/my-web-server**_
  <img width="774" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/779faf5b-0eaf-4e6a-b23c-f0a436c15ce5">

  Now to push image

  Command :- docker push shubham315/my-web-server:0.0.1
  <img width="776" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/0b398237-aa9f-4b6f-b532-d7272e7e63cd">
  <img width="959" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/88626e51-4e6c-4491-96ec-7480199a8026">
  <img width="956" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/ac502f67-e0dc-4cfb-b670-a0d8bcb06a00">

  In above image, we can see when image was pushed along with OS it is compatible with.

  We can also change versions of image and push again.
  <img width="959" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/9a405e61-86e0-4e91-a08f-52113b61fef5">






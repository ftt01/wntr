# wntr

### to build
1. add in requirements.txt the dependencies needed by your project
2. build the image with <code>docker build -f ./Dockerfile -t ftt01/wntr .</code>

### to use
<code>docker run --rm -v $(pwd):/home/wntr/ ftt01/wntr</code>
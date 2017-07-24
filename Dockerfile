FROM golang:1.6

# Install beego and the bee dev tool
RUN go get github.com/astaxie/beego && go get github.com/beego/bee

# Install sysdig support
#RUN apk-install linux-headers
#RUN apt-get -y install linux-headers

# Copy the app into our container
ADD MathApp /go/src/MathApp
ADD views /go/src/MathApp/views
ADD conf /go/src/MathApp/conf

# Expose the application on port 8080
EXPOSE 8080

# Set working dir & container entry point
WORKDIR /go/src/MathApp
CMD ["bee", "run"]

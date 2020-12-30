docker build -t myimage:latest -<<EOF
FROM busybox
RUN echo "hello world"
EOF

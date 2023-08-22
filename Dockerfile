# build phase
from node:16-alpine as builder
workdir '/app'
copy package.json .
run npm install
copy . .
run npm run build


# run phase
#expose port 8080 at nginx
from nginx
expose 80 
copy --from=builder /app/build /usr/share/nginx/html


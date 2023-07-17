```terraform
resource "local_file" "demo" {
  content         = var.content
  filename        = var.filename
  file_permission = "0600"
}
```

```js
var x = 1
console.log(x)
```

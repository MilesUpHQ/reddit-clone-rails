// No file attachments will be allowed
// window.addEventListener("trix-file-accept", function(event) {
//     event.preventDefault()
//     alert("File attachment not supported!")
//   })

window.addEventListener("trix-file-accept", function (event) {
  const acceptedTypes = ['image/jpeg', 'image/png', 'image/jpg', 'image/bmp', 'application/pdf', 'application/zip', 'application/vnd.rar', 'application/msword', 'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']
  const maxFileSize = 1024 * 1024
  if (!acceptedTypes.includes(event.file.type) || event.file.size > maxFileSize) {
    event.preventDefault()
    alert("File type/size not supported")
  }
})     
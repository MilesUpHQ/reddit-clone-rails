// No file attachments will be allowed
// window.addEventListener("trix-file-accept", function(event) {
//     event.preventDefault()
//     alert("File attachment not supported!")
//   })

window.addEventListener("trix-file-accept", function(event) {
    const acceptedTypes = ['image/jpeg', 'image/png']
    const maxFileSize = 1024 * 1024 
    if (!acceptedTypes.includes(event.file.type) || event.file.size > maxFileSize) {
      event.preventDefault()
      alert("File type/size not supported")  
    }
  }) 
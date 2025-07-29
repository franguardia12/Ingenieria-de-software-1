1) En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

Respuesta: En el primer llamado la información que se aporta es el objeto al que se le está enviando el mensaje, reduciendo las posibilidades a uno si inicialmente habían distintos tipos posibles. En el segundo llamado se aporta la información del tipo del colaborador, ya que este en el primer llamado es desconocido y puede ser de varios tipos distintos por lo que en el segundo llamado esta información ya se aclara

2) Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

Respuesta: La lógica de cómo instanciar un objeto debería ser propia de la clase ya que esta representa el concepto general de lo que se está modelando, entonces las diferentes instancias se crean a partir de ella ya que estas sí modelando un ente más concreto de la realidad. Si se crean objetos desde diferentes lugares y de diferentes formas igual hay que seguir utilizando el método de la clase para hacerlo y dentro de este se realizan las valiaciones necesarias para evitar crear instancias inválidas

3) Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

Respuesta: Categorizamos los métodos en función de las responsabilidades que tienen y el grado de acceso que se quiere de estos, por ejemplo si se quiere que puedan ser accedidos externamente o solo son internos de la propia clase. 

4) Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

Respuesta: El objetivo de ese mensaje en la superclase es indicar que ese método no puede utilizarse con ella si no solo con las subclases que es donde debe estar implementado. También para que en caso de extender el modelo en algún momento con nuevas subclases y se olvide implementar algún método que haya sido definido de esa forma en la superclase, el mensaje de error indique que esos métodos deben ser implementados ya que son responsabilidad de esas subclases

5) ¿Por qué está mal/qué problemas trae romper encapsulamiento?

Respuesta: El problema es que las clases terminan muy acopladas entre sí, ya que en lugar de usar solo mensajes para comunicarse y que cada objeto se encargue de lo que le corresponde termina pasando que la implementación de una clase depende mucho de la implementación de la otra. También puede llegar a romper con la idea de jerarquía de clases cuando una clase necesita acceder a información privada de otra (a la cual no se debería poder acceder externamente), en lugar de enviarle un mensaje para que esa clase lo solucione
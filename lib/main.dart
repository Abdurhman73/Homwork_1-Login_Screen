import 'package:flutter/material.dart';

// import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void dispos() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      String name = nameController.text;
      String email = emailController.text;
      String password = passwordController.text;

      print("Name: $name");
      print("Email: $email");
      print("Password: $password");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("تم تسجيل الدخول"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Page",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        elevation: 20,
        backgroundColor: Color.fromARGB(255, 42, 172, 62),
      ),
      backgroundColor: Color.fromARGB(255, 175, 253, 188),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 31, 34, 56),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  floatingLabelStyle: TextStyle(
                    color: Colors.red,
                  ),
                  suffixIcon: Icon(Icons.person),
                  labelText: "inter your name",
                  hintText: "user name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "pless inter name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.email),
                  labelText: "your Email",
                  hintText: "Exampl@gmail.com",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "pleass inter your email";
                  }
                  if (!value.contains("@")) {
                    return "the email is Error";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 14,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  suffixIcon: Icon(Icons.lock_open),
                  labelText: "password",
                  hintText: "pass.....",
                ),
                obscureText: true, //تشفير كلمة المرور
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "pleass inter password";
                  }
                  if (value.length < 6) {
                    return "the password must is large of 6";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              IconButton(
                  onPressed: () {
                    submitForm();
                  },
                  icon: const Icon(
                    Icons.arrow_circle_right,
                    color: Color.fromARGB(255, 37, 61, 38),
                    size: 47,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}

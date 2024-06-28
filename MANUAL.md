# MANUAL
## INSTALANDO O FLUTTER:
### PASSO 1: BAIXAR O SDK DO FLUTTER:
- Acesse o site oficial do Flutter: [flutter.dev](https://flutter.dev)
- Clique em "Get Started" e selecione seu sistema operacional (Windows, macOS ou Linux)
- Baixe o SDK do Flutter para o seu sistema operacional.

### PASSO 2: CONFIGURAR O AMBIENTE:

**No Windows:**

1. Extraia o arquivo baixado em um local desejado.
2. Adicione o caminho `flutter/bin` ao PATH do sistema:
   - Abra o "Painel de Controle" e vá para "Sistema e Segurança" > "Sistema" > "Configurações avançadas do sistema"
   - Clique em "Variáveis de ambiente"
   - Em "Variáveis do sistema", encontre a variável `Path` e clique em "Editar"
   - Adicione o caminho completo para a pasta `flutter/bin`

**No macOS:**

1. Extraia o arquivo baixado.
2. Abra o terminal e adicione o Flutter ao PATH:
   ```bash
   export PATH="$PATH:`pwd`/flutter/bin"
   ```

**No Linux:**

1. Extraia o arquivo baixado.
2. Abra o terminal e adicione o Flutter ao PATH:
   ```bash
   export PATH="$PATH:`pwd`/flutter/bin"
   ```

### PASSO 3: VERIFICAR A INSTALAÇÃO:
No terminal ou prompt de comando, execute o seguinte comando para verificar se o Flutter está instalado corretamente:

```bash
flutter doctor
```

O comando `flutter doctor` verificará a instalação e exibirá um relatório com qualquer dependência que ainda precise ser instalada. Siga as instruções fornecidas para resolver qualquer problema pendente.

## CRIANDO O PRIMEIRO PROJETO:
### PASSO 1: CRIAR UM NOVO PROJETO:
No terminal ou prompt de comando, navegue até o diretório onde você deseja criar o novo projeto e execute o comando:

```bash
flutter create meu_primeiro_projeto
```

Este comando criará um novo diretório chamado `meu_primeiro_projeto` contendo um projeto Flutter básico.

### PASSO 2: NAVEGAR ATÉ O DIRETÓRIO DO PROJETO:
```bash
cd meu_primeiro_projeto
```

### PASSO 3: EXECUTAR O PROJETO:
Para rodar o aplicativo no emulador ou dispositivo, certifique-se de que o emulador está em execução ou o dispositivo está conectado. Em seguida, execute o comando:

```bash
flutter run
```

Isso compilará e iniciará o aplicativo padrão de exemplo no dispositivo ou emulador selecionado.

## ESTRUTURA BÁSICA DE UM PROJETO:
A estrutura básica de um projeto Flutter é a seguinte:

```
meu_primeiro_projeto/
├── android/
├── ios/
├── lib/
│   └── main.dart
├── test/
├── pubspec.yaml
├── README.md
└── ...
```

- **`android/`** e **`ios/`**: Pastas contendo os arquivos específicos das plataformas Android e iOS.
- **`lib/`**: Pasta onde o código Dart do aplicativo é armazenado. O arquivo principal aqui é o `main.dart`.
- **`test/`**: Pasta para testes unitários.
- **`pubspec.yaml`**: Arquivo de configuração do projeto, onde são definidas as dependências e outras configurações.

### EXEMPLO DE CÓDIGO DO `main.dart`:
Aqui está um exemplo simples do conteúdo do `main.dart`:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Meu Primeiro App Flutter'),
        ),
        body: Center(
          child: Text('Olá, Flutter!'),
        ),
      ),
    );
  }
}
```

## GERANDO OS APLICATIVOS:
Para gerar um aplicativo para diferentes plataformas no Flutter, como um executável para Windows (`.exe`) ou um arquivo APK para Android, você precisa seguir etapas específicas para cada plataforma. Abaixo estão os passos básicos para cada uma delas:

### PARA WINDOWS (`.EXE`):
1. **Configuração Inicial:**
   - Verifique se o Flutter está instalado corretamente e configurado no seu ambiente de desenvolvimento.

2. **Compilação do Código:**
   - Abra um terminal na pasta do seu projeto Flutter.
   - Execute o seguinte comando para compilar seu aplicativo para Windows:

     ```
     flutter build windows
     ```

   Isso compilará seu projeto Flutter para uma aplicação Windows na pasta `build\windows`.

3. **Executando o Aplicativo:**
   - Após a compilação, você encontrará o arquivo executável (`.exe`) na pasta `build\windows\runner\Release` (ou `build\windows\runner\Debug` para a versão de depuração).
   - Execute o arquivo `.exe` para iniciar o aplicativo.

### PARA ANDROID (APK):
1. **Configuração Inicial:**
   - Certifique-se de ter o Flutter e o Android SDK configurados corretamente no seu sistema.

2. **Compilação do Código:**
   - Abra um terminal na pasta do seu projeto Flutter.
   - Execute o seguinte comando para gerar o APK:

     ```
     flutter build apk
     ```

   Isso compilará seu projeto Flutter para um arquivo APK que pode ser instalado em dispositivos Android.

3. **Instalando o APK:**
   - Após a conclusão da compilação, você encontrará o arquivo APK na pasta `build\app\outputs\flutter-apk`.
   - Transfira o APK para o dispositivo Android e instale-o normalmente, ou use o comando:

     ```
     flutter install
     ```

     Isso instalará o APK diretamente em um dispositivo Android conectado via USB.

### CONSIDERAÇÕES ADICIONAIS:
- **Versões de Depuração e Release:** Para ambos os casos (Windows e Android), você pode compilar versões de depuração ou release, dependendo das suas necessidades. A versão de release é otimizada para desempenho e pode incluir funcionalidades como obfuscation (ofuscação) para proteger seu código.

- **Configurações Avançadas:** Para configurações mais avançadas, como assinatura de APK para publicação na Play Store ou configurações específicas do aplicativo Windows, consulte a documentação oficial do Flutter e as respectivas plataformas (Windows e Android).

Seguindo esses passos, você poderá gerar e distribuir seu aplicativo Flutter para diferentes plataformas de forma eficiente e conforme suas necessidades de desenvolvimento ou distribuição.



# base_source

Coding pattern MVVM - BaseSource Flutter by GetX

## Require
This project is using getX(4.3.8 or upper)
```
dependencies:
  get: ^4.3.8
```
## Languages
- Install [get_cli](https://pub.dev/packages/get_cli/versions/1.3.10) for generate Languages
- Assump that language place in assets/locales(en_US.json,zh_CN.json..etc)
- run below command to generate languages
```
get generate locales assets/locales
```

Change Language
```
Update
Text(LocaleKeys.locale_title) 
to 
Text(LocaleKeys.locale_title.tr), // .tr 
.....

LanguageService.to.changeLocale(Locale('vi', 'VN'));                 
LanguageService.to.changeLocale(Locale('en', 'US'));
```
## Features
- [x] Coding pattern MVVP for Flutter by GetX
- [x] Apply service pattern & reposiory pattern
- [x] Apply compute() to parser restful api - GetConnect
- [x] Apply DI ViewModel by Bindings Getx

## Change
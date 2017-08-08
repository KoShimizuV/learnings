set PATH=%PATH%;D:\home\ko\learnings\php\003_composer

composer -V

# composer require --dev phpunit/phpunit ^6.2



# composer.json ファイルを下記内容で作成。

[json]
{
    "require": {
        "monolog/monolog": "1.0.*"
    }
}
[/json]

その上で下記を実行
composer require --dev phpunit/phpunit ^4.8

めっちゃ入れてくれた。
<pre>
./composer.json has been updated
Loading composer repositories with package information
Updating dependencies (including require-dev)
Package operations: 21 installs, 0 updates, 0 removals
  - Installing symfony/yaml (v3.3.6): Downloading (100%)
  - Installing sebastian/version (1.0.6): Downloading (100%)
  - Installing sebastian/global-state (1.1.1): Downloading (100%)
  - Installing sebastian/recursion-context (1.0.5): Downloading (100%)
  - Installing sebastian/exporter (1.2.2): Downloading (100%)
  - Installing sebastian/environment (1.3.8): Downloading (100%)
  - Installing sebastian/diff (1.4.3): Downloading (100%)
  - Installing sebastian/comparator (1.2.4): Downloading (100%)
  - Installing doctrine/instantiator (1.0.5): Downloading (100%)
  - Installing phpunit/php-text-template (1.2.1): Downloading (100%)
  - Installing phpunit/phpunit-mock-objects (2.3.8): Downloading (100%)
  - Installing phpunit/php-timer (1.0.9): Downloading (100%)
  - Installing phpunit/php-file-iterator (1.4.2): Downloading (100%)
  - Installing phpunit/php-token-stream (1.4.11): Downloading (100%)
  - Installing phpunit/php-code-coverage (2.2.4): Downloading (100%)
  - Installing webmozart/assert (1.2.0): Downloading (100%)
  - Installing phpdocumentor/reflection-common (1.0): Downloading (100%)
  - Installing phpdocumentor/type-resolver (0.3.0): Downloading (100%)
  - Installing phpdocumentor/reflection-docblock (3.2.2): Downloading (100%)
  - Installing phpspec/prophecy (v1.7.0): Downloading (100%)
  - Installing phpunit/phpunit (4.8.0): Downloading (100%)
symfony/yaml suggests installing symfony/console (For validating YAML files using the lint command)
sebastian/global-state suggests installing ext-uopz (*)
phpunit/phpunit-mock-objects suggests installing ext-soap (*)
phpunit/php-code-coverage suggests installing ext-xdebug (>=2.2.1)
phpunit/phpunit suggests installing phpunit/php-invoker (~1.1)
Writing lock file
Generating autoload files
</pre>




vendor\bin\
phpunit.bat

set PATH=%PATH%;D:\home\ko\learnings\php\003_composer\vendor\bin


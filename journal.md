## 修正 `flutter-service-worker.js`, `manifest.json` 與 `index.html`

### `flutter-service-worker.js`
1. [How to fix service-worker's problem](https://github.com/flutter/flutter/issues/68449)

### `index.html`
1. [Canonical tag](https://ahrefs.com/blog/canonical-tags/#:~:text=A%20canonical%20tag%20%28rel%3D%E2%80%9Ccanonical%E2%80%9D%29%20is%20a%20snippet%20of,the%20main%20one%20and%20thus%2C%20should%20be%20indexed).
2. [base-href problem](https://dev.to/janux_de/automatically-publish-a-flutter-web-app-on-github-pages-3m1f)
3. [Canoical tag2](https://gist.github.com/kosamari/7c5d1e8449b2fbc97d372675f16b566e)

### `manifest.json`
1. [start_url & scope](https://stackoverflow.com/questions/55405231/ionic-4-how-to-configure-a-pwa-to-run-on-a-subfolder)

### auto-deploying, using variables
1. [How to set environment variables](https://docs.github.com/en/actions/learn-github-actions/environment-variables)

### sed 要引入 env 的問題
它會被當字串使喚，除非用`'$Repository'` (即 '...')包起來才可以
[StackOverflow](https://stackoverflow.com/questions/584894/environment-variable-substitution-in-sed)

## Slow Loading Problem
### 藉由設定 Spinner 來解決
[用css解決使用者誤認沒在動作的問題](https://itnext.io/fix-flutter-web-loading-time-with-a-loading-spinner-c5dd36a29f5b)
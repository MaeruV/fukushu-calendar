# 復習カレンダー
<span><kbd><img width="100" src="https://github.com/user-attachments/assets/92b48326-c2c8-441c-8062-20ea86ddf695" /></kbd></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span>[復習カレンダー App Store](https://apps.apple.com/jp/app/%E5%BE%A9%E7%BF%92%E3%82%AB%E3%83%AC%E3%83%B3%E3%83%80%E3%83%BC/id6502852283)</span>

<br>

## ⚪︎ 開発のきっかけ
誰もが勉強をする際に、効率的な学習方法を模索することがあるでしょう。僕は、勉強の本質は「復習」にあると考え、このアプリを開発しました。

資格勉強をしているときに、効果的な復習をサポートしてくれるアプリを探していたのですが、自分の求めるものがなかなか見つかりませんでした。そこで、「それなら、自分が本当に使いやすいアプリを作ろう」と思い立ったのが、このアプリを開発するきっかけです。

<br>

## ⚪︎ 機能一覧                     


| ホーム画面 | その日のタスク |
|:-----------:|:-----------:|
| ![home_page_screen](https://github.com/user-attachments/assets/fefeb63a-ae00-4fd8-a9de-92f29617e16f) | ![week_page_screen](https://github.com/user-attachments/assets/622a90b3-3e44-4b7b-9df4-408bc09004ee) |
| カレンダー風のUIを採用し、日付ごとのタスクが一目で把握できるデザインになっています。予定がある日は視覚的に強調され、今日や近日の予定がすぐに確認できます。 | その日にやるべきタスクを管理する画面。タスクはリスト形式で表示され、完了したものはチェックボックスをタップすることで簡単に管理できます。タスクのステータスが一目でわかるようになっています。 |
|-----------|-----------|
| **スケジュール画面** | **イベント作成画面** |
| ![schedule_page_screen](https://github.com/user-attachments/assets/c54193fb-1ad0-4ddb-947b-c560599124ad) | ![add_event_page_screen](https://github.com/user-attachments/assets/852ffe6f-70d6-4e8c-8af2-85653ae5fbd4) |
| 過去・未来のスケジュールを一覧で確認できる画面。 | 新しいイベントを作成する画面。 |
|-----------|-----------|
| **分析画面** | **メニュー画面** |
| 　![analize_page_screen](https://github.com/user-attachments/assets/3754c289-5ef4-4479-91d4-9622ea501407) | ![mene_page_screen](https://github.com/user-attachments/assets/3fd85c83-9f59-40a5-bf66-fa9184a9c9d9) |
| タスクやスケジュールの達成状況を分析できる画面。過去のデータをもとに、完了したタスク数などをグラフで可視化します。週間、年間の振り返りができ、自分のタスク管理の傾向を把握できるため、より効率的な計画を立てるのに役立ちます。 | アプリ全体の設定や機能にアクセスできるメニュー画面。|

<br>


## ⚪︎ アプリの特徴・こだわりポイント
  - **カレンダー形式のホーム画面**で、やるべきタスクが一目でわかる。
  - **完了したタスクをグラフで可視化**し、学習の進捗を確認できる。
  - **タスクごとに通知を設定可能**で、復習のタイミングを逃さない。

<br>


## ⚪︎ 技術スタック・開発の工夫
| **技術**                | **説明**                                                                                      |
|-----------------------|------------------------------------------------------------------------------------|
| **Flutter**            | マルチプラットフォーム対応により、iOS・Android両方で同じコードベースを活用でき、開発速度を向上。 |
| **Clean Architecture + Riverpod** | 可読性・保守性の高い設計。状態管理をシンプルにし、スケーラビリティを確保。          |
| **データの永続化（Isar）**      | ローカルデータの管理にはIsarを活用。                                                |

<br>

## ⚪︎ 開発の過程・学んだこと
- **理想の復習スケジュール管理を実現するための試行錯誤**  
  当初、シンプルなTo-Doリスト形式で実装を進めていましたが、視覚的に分かりやすくするために **カレンダーUIを採用** しました。これにより、ユーザーが直感的にタスクを管理できるようになりました。  

- **Riverpodによる状態管理の学習**  
  最初は `setState` を多用していたため、コードの可読性が低下し、画面ごとに状態を適切に管理するのが難しいと感じました。そこで**Riverpodを導入し、状態管理を分離** することで、より保守性の高いコードに改善しました。

- **アプリのパフォーマンス改善**  
  カレンダー画面で大量のタスクデータを扱う際、描画の遅延が発生しました。これを解決するために、**`ListView.builder` の適切な利用や `riverpod` の `Provider.autoDispose` を活用** し、不要なリビルドを削減しました。  

<br>

## ⚪︎ ユーザーからのフィードバックや実績
- **「勉強の習慣化に役立つ」「カレンダー形式が見やすい」といったポジティブな評価**  
  ユーザーから「やるべきことが一目で分かるので、勉強のモチベーションが上がる」という声をいただいています。  

<br>

## ⚪︎ 今後の展望・追加予定の機能
- **AIを活用した学習提案機能**  
  ユーザーの学習データを分析し、最適な学習スケジュールをAIが提案する機能を実装予定です。これにより、ユーザーそれぞれに合った学習サポートを提供します。

- **複数のOSへの対応**  
  現在はFlutterで開発していますが、今後はiOSだけでなく、AndroidやWebやデスクトップアプリなどにも対応する予定です。これにより、より多くのプラットフォームでユーザーが同じアカウントを使って学習を続けられるようにします。  

- **ユーザーインターフェースの改善**  
  現在のUI/UXをさらに洗練させ、ユーザーにとって直感的で使いやすいインターフェースを目指します。特に、学習進捗を見やすくしたり、学習中の集中力を高める機能を強化したいと考えています。  

<br>

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

lib/application/config/

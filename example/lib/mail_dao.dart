import 'package:example/mail.dart';
import 'package:floor/floor.dart';

@dao
abstract class MailDao {
  @Query('SELECT * FROM mailinfo WHERE id = :id')
  Future<Mail> findMailById(int id);

  @Query('SELECT * FROM mailinfo WHERE text match \":key\"')
  Future<Mail> findMailByKey(String key);

  @Query('SELECT * FROM mailinfo')
  Future<List<Mail>> findAllMails();

  @Query('SELECT * FROM mailinfo')
  Stream<List<Mail>> findAllMailsAsStream();

  @insert
  Future<void> insertMail(Mail mailInfo);

  @insert
  Future<void> insertMails(List<Mail> mailInfo);

  @update
  Future<void> updateMail(Mail mailInfo);

  @update
  Future<void> updateMails(List<Mail> mailInfo);

  @delete
  Future<void> deleteMail(Mail mailInfo);

  @delete
  Future<void> deleteMails(List<Mail> mailInfo);
}

CREATE trigger article_insert after insert on article for each row
begin
insert
	into
	m_article(
	id,
	userid,
	title,
	summary,
	content,
	status,
	ctime,
	utime
	)
values (
	new.id,
	new.userid,
	new.title,
	new.summary,
	new.content,
	new.status,
	new.ctime,
	new.utime
);
end;
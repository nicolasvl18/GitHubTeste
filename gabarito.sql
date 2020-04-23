-- EX1
CREATE OR REPLACE FUNCTION FU_QT_AVALIACAO_ALUNO (p_cd_aluno INTEGER) RETURN INTEGER
AS
  v_qt_total_avaliacao INTEGER;
BEGIN
  SELECT qt_total_avaliacao INTO v_qt_total_avaliacao
  FROM t_aluno WHERE cd_aluno = p_cd_aluno;
RETURN v_qt_total_avaliacao;
END;

-- teste
--SELECT FU_QT_AVALIACAO_ALUNO(1) FROM DUAL;

--EX2
CREATE OR REPLACE FUNCTION FU_QT_AVALIACAO_DISCIPLINA (p_cd_disciplina INTEGER) RETURN INTEGER
AS
  v_qt_total_avaliacao_impressa  INTEGER;
BEGIN
  SELECT COUNT(*) INTO v_qt_total_avaliacao_impressa
  FROM t_aplicacao WHERE cd_disciplina = p_cd_disciplina;
Return v_qt_total_avaliacao_impressa;
END;
-- teste
-- SELECT FU_QT_AVALIACAO_DISCIPLINA(2) FROM DUAL;

--EX3
CREATE OR REPLACE TRIGGER tr_after_insert_aplicacao
AFTER INSERT ON T_APLICACAO FOR EACH ROW
DECLARE
BEGIN
  UPDATE T_ALUNO
  SET QT_TOTAL_AVALIACAO = QT_TOTAL_AVALIACAO + 1
  WHERE CD_ALUNO = :new.cd_aluno;
END;
-- teste
--select * from T_ALUNO where CD_ALUNO = 6;
--insert into T_APLICACAO(CD_APLICACAO, CD_PROFESSOR, CD_DISCIPLINA, CD_ALUNO, DATA) values (88,3,3,6,trunc(sysdate, 'DD'));
--commit;
--select * from T_ALUNO where CD_ALUNO = 6;

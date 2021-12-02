from PyQt5 import uic,QtWidgets
import mysql
from mysql.connector import connection, cursor

def connection():

    conn = mysql.connector.connect (
        host = "localhost",
        user = "root",
        password = "12341234",
        database = "db_freud"
    )

    return conn

def chama_tela():

    usuario = login.lineEdit.text()
    senha = login.lineEdit_2.text()
    login.label_3.setText("")

    conn = connection()

    cursor = conn.cursor()

    try:
        cursor.execute("SELECT senha_login, id_matricula FROM tb_login WHERE email_login = '{}'".format(usuario))
        senha_bd = cursor.fetchall()
        print(f"Senha no banco: {senha_bd[0][0]}")
        print(f"Id Matricula: {senha_bd[0][1]}")

        id_matricula = int(senha_bd[0][1])

        cursor.execute("SELECT id_nivel, nome FROM tb_matricula WHERE id_matricula = '{}'".format(id_matricula))
        id_nivel_banco = cursor.fetchall()

        print(f"id nivel: {id_nivel_banco[0][0]}")
        print(f"nome no banco de dados: {id_nivel_banco[0][1]}")
        cursor.close()
        conn.close()

        id_nivel = int(id_nivel_banco[0][0])
        nome = str(id_nivel_banco[0][1])

        if senha == senha_bd[0][0]:
            login.lineEdit_2.setText("")
            login.label_3.setText("")
            login.close()

            if id_nivel == 1:
                tela_adm.show()
                tela_adm.label_3.setText("{}".format(nome))
            elif id_nivel == 2:
                tela_professor.show()
                tela_professor.label_3.setText("{}".format(nome))
            else:
                tela_aluno.show()
                tela_aluno.label_3.setText("{}".format(nome))

        elif senha != senha_bd[0][0]:

            login.label_3.setText("Login ou senha incorretos!")
    except:
        id_matricula = 0
        login.label_3.setText("Login ou senha incorretos!")

    return id_matricula

def cadastrar_usuario():
 
    nome = criar_conta.lineEdit.text()
    cpf = criar_conta.lineEdit_2.text()
    nascimento = criar_conta.lineEdit_3.text()
    endereco = criar_conta.lineEdit_4.text()
    nome_mae = criar_conta.lineEdit_5.text()
    nome_pai = criar_conta.lineEdit_6.text()
    id_disciplina = criar_conta.lineEdit_7.text()

    if criar_conta.radioButton.isChecked():

        nivel = 2

    else:

        nivel = 3


    conn = connection()

    cursor = conn.cursor()

    try:
        command_sql = ("INSERT INTO tb_matricula (id_nivel, nome, cpf, nascimento, endereco, nome_mae, nome_pai, id_disciplina) values (%s, %s, %s, %s, %s, %s, %s, %s)")
        data = (
            nivel,
            nome,
            cpf,
            nascimento,
            endereco,
            nome_mae,
            nome_pai,
            id_disciplina
        )

        cursor.execute(command_sql, data)
        conn.commit()

        cursor.execute(("SELECT id_matricula, nome FROM tb_matricula WHERE nome = '{}'".format(nome)))
        dados = cursor.fetchall()

        id = dados[0][0]
        nome = nome.lstrip().lower().replace(" ", "")
        
        sql = "INSERT INTO tb_login (id_matricula, email_login, senha_login) values (%s, %s, %s)"
        data = (
            id,
            f"{nome}@freud.com",
            f"{nome}123@"
        )

        cursor.execute(sql, data)
        conn.commit()

        sql = "INSERT INTO meio_campo (id_matricula, id_disciplina) values (%s, %s)"
        data = (
            id,
            id_disciplina
        )

        cursor.execute(sql, data)
        conn.commit()

        cursor.close()
        conn.close()

        criar_conta.close()
        tela_adm.show()

         
        criar_conta.lineEdit.setText("")
        criar_conta.lineEdit_2.setText("")
        criar_conta.lineEdit_3.setText("")
        criar_conta.lineEdit_4.setText("")
        criar_conta.lineEdit_5.setText("")
        criar_conta.lineEdit_6.setText("")


    except:
        criar_conta.label_6.setText("Erro ao cadastrar! (não conectou ao bd)")

def editar_senhas():

    usuario = editar_senha.lineEdit.text()
    nova_senha = editar_senha.lineEdit_2.text()
    confirmar_senha = editar_senha.lineEdit_3.text()

    conn = connection()

    cursor = conn.cursor()

    try:
        cursor.execute("SELECT email_login FROM tb_login WHERE email_login = '{}'".format(usuario))
        confirma_usuario = cursor.fetchall()
    except:
        editar_senha.label_3.setText("E-mail não existe no nosso sistema!")

    if nova_senha == confirmar_senha:

        try:
            cursor.execute("UPDATE tb_login SET senha_login = '{}' WHERE email_login = '{}'".format(nova_senha, usuario))
            conn.commit()
            editar_senha.close()
            login.show()
        except:
            editar_senha.label_3.setText("Erro ao atualizar a senha!")
    else:
        editar_senha.label_3.setText("As senhas não são iguais!")

def excluir_contas():

    usuario = excluir_conta.lineEdit.text()

    conn = connection()

    cursor = conn.cursor()

    try:

        cursor.execute("SELECT id_matricula FROM tb_login WHERE email_login = '{}'".format(usuario))
        id_excluir = cursor.fetchall()
        excluir = int(id_excluir[0][0])
        print(f"Id matricula para excluir: {excluir}")

        cursor.execute("DELETE FROM tb_login WHERE email_login = '{}'".format(usuario))
        conn.commit()

        cursor.execute("DELETE FROM tb_matricula WHERE id_matricula = '{}'".format(excluir))
        conn.commit()

        tela_adm.show()
        excluir_conta.close()
    except:
            excluir_conta.label_5.setText("Erro ao deletar usuário! (Não conectou ao bd)")

def meu_perfil_aluno():

    tela_aluno.close()
    perfil_aluno.show()

    id_matri = chama_tela()

    conn = connection()

    cursor = conn.cursor()

    try:
        cursor.execute("SELECT nome, cpf, nascimento, endereco, nome_mae, nome_pai FROM tb_matricula WHERE id_matricula = '{}'".format(id_matri))
        dados = cursor.fetchall()

        perfil_aluno.label_3.setText("{}".format(dados[0][0]))
        perfil_aluno.label_10.setText("{}".format(dados[0][1]))
        perfil_aluno.label_5.setText("{}".format(dados[0][2]))
        perfil_aluno.label_9.setText("{}".format(dados[0][3]))
        perfil_aluno.label_7.setText("{}".format(dados[0][4]))
        perfil_aluno.label_8.setText("{}".format(dados[0][5]))

        cursor.close()
        conn.close()

    except:

        print("erro (bd)")

def meu_perfil_professor():

    tela_professor.close()
    perfil_professor.show()

    id_matri = chama_tela()

    conn = connection()

    cursor = conn.cursor()

    try:
        cursor.execute("SELECT nome, cpf, nascimento, endereco, nome_mae, nome_pai, id_disciplina FROM tb_matricula WHERE id_matricula = '{}'".format(id_matri))
        dados = cursor.fetchall()

        perfil_professor.label_3.setText("{}".format(dados[0][0]))
        perfil_professor.label_10.setText("{}".format(dados[0][1]))
        perfil_professor.label_5.setText("{}".format(dados[0][2]))
        perfil_professor.label_9.setText("{}".format(dados[0][3]))
        perfil_professor.label_7.setText("{}".format(dados[0][4]))
        perfil_professor.label_8.setText("{}".format(dados[0][5]))
        
        if dados[0][6] == 1:
            perfil_professor.label_17.setText("História")
        elif dados[0][6] == 2:
            perfil_professor.label_17.setText("Geografia")
        elif dados[0][6] == 3:
            perfil_professor.label_17.setText("Português")
        elif dados[0][6] == 4:
            perfil_professor.label_17.setText("Matemática")
        elif dados[0][6] == 5:
            perfil_professor.label_17.setText("Ed. Física")
        elif dados[0][6] == 6:
            perfil_professor.label_17.setText("Artes")

        cursor.close()
        conn.close()

    except:

        print("erro (bd)")

def logout_adm():
    tela_adm.close()
    login.label_3.setText("")
    login.show()

def logout_professor():
    tela_professor.close()
    login.label_3.setText("")
    login.show()

def logout_aluno():
    tela_aluno.close()
    login.label_3.setText("")
    login.show()

def fecha_perfil_aluno():

    tela_aluno.show()
    perfil_aluno.close()

def fechar_perfil_professor():

    tela_professor.show()
    perfil_professor.close()

def fechar_criar_conta():

    tela_adm.show()
    criar_conta.close()

def fechar_ver_notas():

    tela_aluno.show()
    notas_aluno.close()

def fechar_adicionar_nota():

    adicionar_notas.close()
    tela_professor.show()

def abre_editar_senha():
    login.close()
    editar_senha.show()

def abre_criar_conta_adm():
    tela_adm.close()
    criar_conta.show()

def abre_excluir_conta_adm():
    
    tela_adm.close()
    excluir_conta.show()

def abre_adicionar_nota():

    tela_professor.close()
    adicionar_notas.show()

def adicionar_nota():

    try:
        conn = connection()
        cursor = conn.cursor()

        id_professor = chama_tela()

        nota1 = float(adicionar_notas.lineEdit.text())
        rec1 = adicionar_notas.lineEdit_6.text()

        if rec1 == "":
            rec1 = 0
        else:
            rec1 = float(adicionar_notas.lineEdit_6.text())

        nota2 = float(adicionar_notas.lineEdit_2.text())
        rec2 = adicionar_notas.lineEdit_5.text()

        if rec2 == "":
            rec2 = 0
        else:
            rec2 = float(adicionar_notas.lineEdit_5.text())

        trab1 = float(adicionar_notas.lineEdit_3.text())
        rectrab1 = adicionar_notas.lineEdit_4.text()

        if rectrab1 == "":
            rectrab1 = 0
        else:
            rectrab1 = float(adicionar_notas.lineEdit_4.text())

        id_matricula = int(adicionar_notas.lineEdit_7.text())

        cursor.execute(("SELECT id_disciplina FROM meio_campo WHERE id_matricula = '{}'".format(id_professor)))
        id_disciplina_errado = cursor.fetchall()

        for n in id_disciplina_errado:

            for id_fodase in n:

                ids_disciplina = id_fodase

        #print(f"Id da disciplina: {ids_disciplina}")

        id_disciplina = int(ids_disciplina)
    except:
        print("Nao sei")

    try:

        command_sql = ("INSERT INTO tb_notas ( id_matricula, id_disciplina, nota1, rec1, nota2, rec2, t1, rect1 ) values ( %s, %s, %s, %s, %s, %s, %s, %s )")

        data = (
            id_matricula,
            id_disciplina,
            nota1,
            rec1,
            nota2,
            rec2,
            trab1,
            rectrab1
        )

        cursor.execute(command_sql, data)
        conn.commit()

        adicionar_notas.close()
        adicionar_notas.lineEdit.setText("")
        adicionar_notas.lineEdit_2.setText("")
        adicionar_notas.lineEdit_3.setText("")
        adicionar_notas.lineEdit_4.setText("")
        adicionar_notas.lineEdit_5.setText("")
        adicionar_notas.lineEdit_6.setText("")
        adicionar_notas.lineEdit_7.setText("")
        tela_professor.show()

    except:

        print("deu ruim AO CONECTAR COM BD")

def ver_notas():

    tela_aluno.close()
    notas_aluno.show()

    id_matri = chama_tela()

    conn = connection()
    cursor = conn.cursor()

    try:
            
        cursor.execute("SELECT id_disciplina, nota1, rec1, nota2, rec2, t1, rect1 FROM tb_notas WHERE id_matricula = '{}'".format(id_matri)) 
        dados = cursor.fetchall()

        #print(dados)

        '''
        print(dados[0][0])
        print(dados[1][0])
        print(dados[2][0])
        print(dados[3][0])
        print(dados[4][0])
        print(dados[5][0])
        print(dados[6][0])
        '''

        for n in dados:
            if n[0] == 1:
                hist1 = n[1]
                if n[2] > n[1]:
                    hist1 = n[2]
                    print(f"Nota 1 Hist - {hist1}")

                hist2 = n[3]
                if n[4] > n[3]:
                    hist2 = n[4]
                    print(f"Nota 2 Hist - {hist2}")

                hist3 = n[5]
                if n[6] > n[5]:
                    hist3 = n[5]
                    print(f"Nota 3 Hist - {hist3}")

                mediahist = (hist1 + hist2 + hist3) / 3

                print(f"Média Hist - {mediahist}")

            elif n[0] == 2:
                geo1 = n[1]
                if n[2] > n[1]:
                    geo1 = n[2]
                print(f"Nota 1 Geo - {geo1}")

                geo2 = n[3]
                if n[4] > n[3]:
                    geo2 = n[4]
                print(f"Nota 2 Geo - {geo2}")

                geo3 = n[5]
                if n[6] > n[5]:
                    geo3 = n[6]
                print(f"Nota 3 Geo - {geo3}")

                mediageo = (geo1 + geo2 + geo3) / 3

                print(f"Média Geo - {mediageo}")

            elif n[0] == 3:
                port1 = n[1]
                if n[2] > n[1]:
                    port1 = n[2]
                print(f"Nota 1 Port - {port1}")

                port2 = n[3]
                if n[4] > n[3]:
                    port2 = n[4]
                print(f"Nota 2 Port - {port2}")

                port3 = n[5]
                if n[6] > n[5]:
                    port3 = n[6]
                print(f"Nota 3 Port - {port3}")

                mediaport = (port1 + port2 + port3) / 3

                print(f"Média Port - {mediaport}")

            elif n[0] == 4:
                matem1 = n[1]
                if n[2] > n[1]:
                    matem1 = n[2]
                print(f"Nota 1 MTM - {matem1}")

                matem2 = n[3]
                if n[4] > n[3]:
                    matem2 = n[4]
                print(f"Nota 2 MTM - {matem2}")

                matem3 = n[5]
                if n[6] > n[5]:
                    matem3 = n[6]
                print(f"Nota 3 MTM - {matem3}")

                mediamatem = (matem1 + matem2 + matem3) / 3

                print(f"Média MTM - {mediamatem}")

            elif n[0] == 5:
                ed1 = n[1]
                if n[2] > n[1]:
                    ed1 = n[2]
                print(f"Nota 1 Ed. Física - {ed1}")

                ed2 = n[3]
                if n[4] > n[3]:
                    ed2 = n[4]
                print(f"Nota 2 Ed. Física - {ed2}")

                ed3 = n[5]
                if n[6] > n[5]:
                    ed3 = n[6]
                print(f"Nota 3 Ed. Física - {ed3}")

                mediaed = (ed1 + ed2 + ed3) / 3

                print(f"Média Ed. Física - {mediaed}")

            elif n[0] == 6:
                art1 = n[1]
                if n[2] > n[1]:
                    art1 = n[2]
                print(f"Nota 1 Art - {art1}")

                art2 = n[3]
                if n[4] > n[3]:
                    art2 = n[4]
                print(f"Nota 2 Art - {art2}")

                art3 = n[5]
                if n[6] > n[5]:
                    art3 = n[6]
                print(f"Nota 3 Art - {art3}")

                mediaart = (art1 + art2 + art3) / 3

                print(f"Média Artes - {mediaart}")

    except:
        print("Não conectou banco!")

    try:
        situacao = ""

        if mediaart > 7 and mediaed > 7 and mediageo > 7 and mediahist > 7 and mediamatem > 7 and mediaport > 7:
            situacao = "Aprovado"

        elif mediaart < 7 or mediaed < 7 or mediageo < 7 or mediahist < 7 or mediamatem < 7 or mediaport < 7:
            situacao = "Recuperação"
        
        elif mediaart < 4 or mediaed < 4 or mediageo < 4 or mediahist < 4 or mediamatem < 4 or mediaport < 4:
            situacao = "Reprovado"

        print(f"Situação {situacao}")
    except:

        print("Deu ruim")

    
    
    notas_aluno.label_10.setText("{}".format(hist1))  # nota 1   história
    notas_aluno.label_17.setText("{}".format(hist2))  # nota 2   história
    notas_aluno.label_18.setText("{}".format(hist3))  # nota 3   história
    notas_aluno.label_19.setText("{}".format(round(mediahist, 2)))  # médiaf   história 
    notas_aluno.label_3.setText("{}".format(geo1))   # nota 1  geografia
    notas_aluno.label_21.setText("{}".format(geo2))  # nota 2  geografia 
    notas_aluno.label_26.setText("{}".format(geo3))  # nota 3  geografia
    notas_aluno.label_31.setText("{}".format(round(mediageo, 2)))  # médiaf  geografia
    notas_aluno.label_9.setText("{}".format(port1))   # nota 1  português
    notas_aluno.label_22.setText("{}".format(port2))  # nota 2  português
    notas_aluno.label_27.setText("{}".format(port3))  # nota 3  português
    notas_aluno.label_32.setText("{}".format(round(mediaport, 2)))  # médiaf  português
    notas_aluno.label_8.setText("{}".format(matem1))   # nota 1 matemática
    notas_aluno.label_23.setText("{}".format(matem2))  # nota 2 matemática
    notas_aluno.label_28.setText("{}".format(matem3))  # nota 3 matemática
    notas_aluno.label_33.setText("{}".format(round(mediamatem, 2)))  # médiaf matemática
    notas_aluno.label_7.setText("{}".format(ed1))   # nota 1 ed. física
    notas_aluno.label_24.setText("{}".format(ed2))  # nota 2 ed. física
    notas_aluno.label_29.setText("{}".format(ed3))  # nota 3 ed. física
    notas_aluno.label_34.setText("{}".format(round(mediaed, 2)))  # média ed.  física
    notas_aluno.label_5.setText("{}".format(art1))   # nota 1      artes
    notas_aluno.label_25.setText("{}".format(art2))  # nota 2      artes
    notas_aluno.label_30.setText("{}".format(art3))  # nota 3      artes
    notas_aluno.label_35.setText("{}".format(round(mediaart, 2)))  # médiaf      artes
        
    notas_aluno.label_40.setText("{}".format(situacao))  # situação

app = QtWidgets.QApplication([])
login = uic.loadUi("sources/login.ui")
tela_adm = uic.loadUi("sources/tela_ADM.ui")
tela_aluno = uic.loadUi("sources/tela_aluno.ui")
tela_professor = uic.loadUi("sources/tela_professor.ui")
editar_senha = uic.loadUi("sources/editar_senha.ui")
criar_conta = uic.loadUi("sources/criarConta_adm.ui")
excluir_conta = uic.loadUi("sources/excluirConta_adm.ui")
perfil_aluno = uic.loadUi("sources/meuPerfil_alunos.ui")
perfil_professor = uic.loadUi("sources/meuPerfil_professor.ui")
adicionar_notas = uic.loadUi("sources/adcionarNotas_professor.ui")
notas_aluno = uic.loadUi("sources/notas_aluno.ui")


tela_adm.pushButton.clicked.connect(logout_adm)
tela_professor.pushButton.clicked.connect(logout_professor)
tela_aluno.pushButton.clicked.connect(logout_aluno)
login.pushButton_2.clicked.connect(chama_tela)
login.pushButton.clicked.connect(abre_editar_senha)
editar_senha.pushButton_2.clicked.connect(editar_senhas)
tela_adm.pushButton_2.clicked.connect(abre_criar_conta_adm)
tela_adm.pushButton_4.clicked.connect(abre_excluir_conta_adm)
criar_conta.pushButton_2.clicked.connect(cadastrar_usuario)
excluir_conta.pushButton_4.clicked.connect(excluir_contas)
tela_aluno.pushButton_3.clicked.connect(meu_perfil_aluno)
tela_aluno.pushButton_2.clicked.connect(ver_notas)
tela_professor.pushButton_3.clicked.connect(meu_perfil_professor)
tela_professor.pushButton_2.clicked.connect(abre_adicionar_nota)
perfil_aluno.pushButton.clicked.connect(fecha_perfil_aluno)
perfil_professor.pushButton.clicked.connect(fechar_perfil_professor)
adicionar_notas.pushButton_2.clicked.connect(adicionar_nota)
notas_aluno.pushButton.clicked.connect(fechar_ver_notas)
adicionar_notas.pushButton_3.clicked.connect(fechar_adicionar_nota)

criar_conta.pushButton_2.clicked.connect(fechar_criar_conta)

login.show()
app.exec()
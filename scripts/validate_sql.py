import os
import sys
import sqlparse
import glob

def validate_sql_file(file_path):
    print(f"Validando {file_path}...")
    try:
        with open(file_path, 'r') as f:
            sql_content = f.read()
        
        # Verificação básica de sintaxe usando sqlparse
        parsed = sqlparse.parse(sql_content)
        if not parsed:
            print(f"Erro: Não foi possível analisar {file_path}")
            return False
        
        # Verificação de sintaxe SQL básica
        for statement in parsed:
            if not statement.tokens:
                print(f"Aviso: Declaração vazia em {file_path}")
        
        return True
    except Exception as e:
        print(f"Erro ao validar {file_path}: {str(e)}")
        return False

def main():
    sql_files = []
    # Encontrar todos os arquivos SQL no projeto
    for pattern in ['**/*.sql', 'normalization/*.sql']:
        sql_files.extend(glob.glob(pattern, recursive=True))
    
    if not sql_files:
        print("Nenhum arquivo SQL encontrado para validar")
        return 0
    
    print(f"Encontrados {len(sql_files)} arquivos SQL para validar")
    
    failed = 0
    for sql_file in sql_files:
        if not validate_sql_file(sql_file):
            failed += 1
    
    if failed:
        print(f"Validação falhou para {failed} arquivos SQL")
        return 1
    else:
        print("Todos os arquivos SQL foram validados com sucesso")
        return 0

if __name__ == "__main__":
    sys.exit(main())
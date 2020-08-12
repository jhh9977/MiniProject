package board.dao;

import java.util.List;

import model.Board;

public interface Dao {
	void insert(Board b);	//�� ���� db�� ����

	Board select(int num);	//�� �ϳ��� ���� ���� �˻��Ͽ� Board��ü ��ȯ

	List<Board> selectAll();		//�� ��ü �˻��Ͽ� List�� ��ȯ

	void update(Board b);	//�� ���� db���� ����

	void delete(int num);	//�� ��ȣ�� db���� ����
}

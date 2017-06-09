package bdlab;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class DBTest {
	public static class Word {
		private int wordId;
		
		private String wordPL;

		private String wordDE;
		
		private int wordLvl;

		public int getWordLvl() {
			return wordLvl;
		}

		public void setWordLvl(int wordLvl) {
			this.wordLvl = wordLvl;
		}

		public int getWordId() {
			return wordId;
		}

		public void setWordId(int wordId) {
			this.wordId = wordId;
		}

		public String getWordPL() {
			return wordPL;
		}

		public void setWordPL(String wordPL) {
			this.wordPL = wordPL;
		}

		public String getWordDE() {
			return wordDE;
		}

		public void setWordDE(String wordDE) {
			this.wordDE = wordDE;
		}


		public Word(int id, String firstName, String lastName) {
			super();
			this.wordId = wordId;
			this.wordPL = wordPL;
			this.wordDE = wordDE;
			this.wordLvl = wordLvl;
		}

		public Word() {
		}
		
		public String toString() {
			return String.format("Word(%d, %s, %s, %d)", wordId, wordPL, wordDE, wordLvl); 
		}
	}

	public final static ResultSetToBean<Word> wordConverter = new ResultSetToBean<Word>() {
		public Word convert(ResultSet rs) throws Exception {
			Word w = new Word();
			w.setWordId(rs.getInt("WordID"));
			w.setWordPL(rs.getString("WordPL"));
			w.setWordDE(rs.getString("WordDE"));
			w.setWordLvl(rs.getInt("WordLevel"));
			return w;
		}
	};

	public static void main(String[] args) {

		List<Word> words = DBManager
				.run(new Query() {
					public void prepareQuery(PreparedStatement ps)
							throws Exception {
						ps.setInt(1, 1);
					}
				}, wordConverter,
						"select WordID, WordPL, WordDE, WordLevel from Words where WordLevel = ?");

		for (Word w: words) {
			System.out.println(w);
		}
		
		boolean result = DBManager.run(new Task<Boolean>() {
			public Boolean execute(PreparedStatement ps) throws Exception {
				ps.setInt(1, 1);
				ps.setInt(2, 8);
				return ps.executeUpdate() > 0;
			}
		}, "update Words set WordLevel = ? where WordId = ?");
	
		System.out.println(result ? "Udalo sie" : "Nie udalo sie");
		
		words = DBManager
				.run(new Query() {
					public void prepareQuery(PreparedStatement ps)
							throws Exception {
						ps.setInt(1, 1);
					}
				}, wordConverter,
						"select WordID, WordPL, WordDE, WordLevel from Words where WordLevel = ?");

		
		for (Word w: words) {
			System.out.println(w);
		}
		
		// INSERT
		result = DBManager.run(new Task<Boolean>() {
			public Boolean execute(PreparedStatement ps) throws Exception {
				//ps.setInt(1, 3);
				//ps.setInt(2, 8);
				return ps.executeUpdate() > 0;
			}
		}, "insert into Words (WordID, WordPL, WordDE, WordLevel) values (words_seq.nextval, 'kon', 'das Pferde', 2)");
	
		System.out.println(result ? "Udalo sie" : "Nie udalo sie");
		
		// SELECT
		words = DBManager
				.run(new Query() {
					public void prepareQuery(PreparedStatement ps)
							throws Exception {
						//ps.setInt(1, 1);
					}
				}, wordConverter,
						"select WordID, WordPL, WordDE, WordLevel from Words");

		
		for (Word w: words) {
			System.out.println(w);
		}
		
		// DELETE
				result = DBManager.run(new Task<Boolean>() {
					public Boolean execute(PreparedStatement ps) throws Exception {
						ps.setString(1, "kon");
						//ps.setInt(2, 8);
						return ps.executeUpdate() > 0;
					}
				}, "Delete from words where WordPL = ?");
			
				System.out.println(result ? "Udalo sie" : "Nie udalo sie");
				
				// SELECT
				words = DBManager
						.run(new Query() {
							public void prepareQuery(PreparedStatement ps)
									throws Exception {
								//ps.setInt(1, 1);
							}
						}, wordConverter,
								"select WordID, WordPL, WordDE, WordLevel from Words");

				
				for (Word w: words) {
					System.out.println(w);
				}
	}

}

package business.externalinterfaces;

import java.util.List;

import middleware.exceptions.DatabaseException;
import middleware.externalinterfaces.DbClass;

public interface DbClassOrderForTest extends DbClass {

	public List<Integer> readOrderHistoryForTest(CustomerProfile customer) throws DatabaseException;
}

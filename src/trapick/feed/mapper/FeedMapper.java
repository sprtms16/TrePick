package trapick.feed.mapper;

import java.util.List;
import java.util.Map;

import trapick.feed.domain.Feed;
import trapick.feed.domain.Heart;

public interface FeedMapper {

	int insertFeed(Feed feed);

	List<Feed> feedList(Map<String, Object> map);

	Feed getFeed(int feed_idx);

	int updateFeedHeart(Heart heart);

	int deleteFeed(int feed_idx);

	Feed updateFeed(int feed_idx);

	int updateFeedAction(Feed feed);

	int selectFeedHeartCount(int feed_idx);

	int selectFeedHeartCheck(int user_idx);

	List<Feed> hashtagList(int feed_idx);


}

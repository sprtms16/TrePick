package trapick.feed.mapper;

import java.util.List;

import trapick.feed.domain.Feed;
import trapick.feed.domain.Heart;

public interface FeedMapper {

	int insertFeed(Feed feed);

	List<Feed> feedList(int user_idx);

	Feed getFeed(int feed_idx);

	int deleteFeed(int feed_idx);

	Feed updateFeed(int feed_idx);

	int updateFeedAction(Feed feed);

	int selectFeedHeartCount(int feed_idx);

	int selectFeedHeartCheck(Heart heart);

	int deleteFeedHeart(Heart heart);

	int insertFeedHeart(Heart heart);

}

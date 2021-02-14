import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/post_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile-avatar.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                const SizedBox(height: 4),
                Text(post.caption),
                post.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(height: 6)
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({
    Key key,
    @required this.post,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.user.name,
                  style: TextStyle(fontWeight: FontWeight.w600)),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  Icon(Icons.public, color: Colors.grey[600], size: 12)
                ],
              )
            ],
          ),
        ),
        IconButton(
            icon: const Icon(Icons.more_horiz), onPressed: () => print('More'))
      ],
    );
  }
}

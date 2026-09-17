import 'dart:convert';
import 'package:http/http.dart' as http;

class GithubService {
  static const String _base = 'https://api.github.com';

  Future<Map<String, dynamic>?> getLatestRelease(String owner, String repo) async {
    final url = Uri.parse('$_base/repos/$owner/$repo/releases/latest');
    final response = await http.get(url, headers: {
      'Accept': 'application/vnd.github+json',
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }
    return null;
  }

  String? getApkUrl(Map<String, dynamic> release) {
    final assets = release['assets'] as List<dynamic>?;
    if (assets == null) return null;

    for (final asset in assets) {
      final name = asset['name'] as String? ?? '';
      if (name.endsWith('.apk')) {
        return asset['browser_download_url'] as String?;
      }
    }
    return null;
  }

  String getVersion(Map<String, dynamic> release) {
    final tag = release['tag_name'] as String? ?? '';
    return tag.replaceFirst('v', '');
  }
}

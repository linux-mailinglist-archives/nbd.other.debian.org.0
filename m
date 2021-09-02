Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C223FF6D9
	for <lists+nbd@lfdr.de>; Fri,  3 Sep 2021 00:07:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6A8F120A5A; Thu,  2 Sep 2021 22:07:54 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep  2 22:07:54 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 97FB720A3C
	for <lists-other-nbd@bendel.debian.org>; Thu,  2 Sep 2021 22:07:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.628 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.747,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 10LVsBWczlUb for <lists-other-nbd@bendel.debian.org>;
	Thu,  2 Sep 2021 22:07:41 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id DEC2520A32
	for <nbd@other.debian.org>; Thu,  2 Sep 2021 22:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630620455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VQ6rPqE1SJ94mwkOBlPjXI3UXXzo92LzD9+JqdJEzCw=;
	b=VwkHku4OcIWEK0KbQ5yz+dsf5NduQJngp3pJjXUM3TrTVX4HKAp0I3XCGOr21+VF5cwBn6
	ZjMquOOBGBQkA0Xp7QnwP7eqOvaAOtSmaV6I41RcsL37FVMvJnjwsRNsWfcSgSMswz2f9l
	XiGM0Ya2bK0tH+wkO6H/sHwqxsQrzfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-a6ZdtxzbNOa-oyxBpfFDQw-1; Thu, 02 Sep 2021 18:07:34 -0400
X-MC-Unique: a6ZdtxzbNOa-oyxBpfFDQw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A84BC6D253
	for <nbd@other.debian.org>; Thu,  2 Sep 2021 22:07:33 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A135D19C46;
	Thu,  2 Sep 2021 22:07:29 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: libguestfs@redhat.com
Subject: [PATCH] client: Don't confuse Unix socket with TLS hostname
Date: Thu,  2 Sep 2021 17:07:29 -0500
Message-Id: <20210902220729.974965-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8Am4rdnXXlF.A.XmH.6sUMhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1362
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210902220729.974965-1-eblake@redhat.com
Resent-Date: Thu,  2 Sep 2021 22:07:54 +0000 (UTC)

When using -u but not -H, we were ending up calling
gnutls_session_set_verify_cert() with the Unix socket's path name,
which is bound to fail (hostnames don't start with /).  Saner is to
only default tlshostname when using TCP sockets.

See also https://gitlab.com/nbdkit/nbdkit/-/issues/1, as this was
detected during an attempt to prove TLS interoperability between
nbd-client and nbdkit.  Pre-patch, I have to add '-H localhost' to the
nbd-client command line when using nbdkit with a Unix socket, but not
when using a TCP socket; post-patch, I can omit -H and still connect
/dev/nbd0 over TLS using either TCP or Unix.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd-client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/nbd-client.c b/nbd-client.c
index e9079a9..463ff86 100644
--- a/nbd-client.c
+++ b/nbd-client.c
@@ -1186,7 +1186,7 @@ int main(int argc, char *argv[]) {
 		}
 	}

-        if (!tlshostname && hostname)
+        if (!tlshostname && hostname && !b_unix)
                 tlshostname = strdup(hostname);

 	if (netlink)
-- 
2.31.1


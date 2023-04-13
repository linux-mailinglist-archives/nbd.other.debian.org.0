Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7CE6E171A
	for <lists+nbd@lfdr.de>; Fri, 14 Apr 2023 00:03:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EF95420580; Thu, 13 Apr 2023 22:03:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr 13 22:03:09 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2098B2056F
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Apr 2023 22:02:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.082 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Jtol6UXOOrAl for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Apr 2023 22:02:51 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id C473220529
	for <nbd@other.debian.org>; Thu, 13 Apr 2023 22:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681423365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=id5hnqBh8jVY7ZUaAEbBHLXLcu2V6UBlOULC5baAkGU=;
	b=YF3LKVUBMjP4PU6P1tcWAYcPGfbQidnzFY/25iRqiJOGOxRgb+ltIDjYUT7R4pHbJl8Ia3
	f/Kr+0iZ73u/Ruy0ivoIP6xuHeEVbAerKpNGC6bRjvuqLLVZ2zFknihJsJ4b2Pcggk/vlv
	I59VfoWoixixnJRO+8BVNrG5U80vjP4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-9dR0QCOTMjqBbuf2SaFfQg-1; Thu, 13 Apr 2023 18:02:42 -0400
X-MC-Unique: 9dR0QCOTMjqBbuf2SaFfQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC58A811E7C;
	Thu, 13 Apr 2023 22:02:41 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 894EB2027043;
	Thu, 13 Apr 2023 22:02:41 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH v3 0/6] NBD 64-bit extensions (spec only)
Date: Thu, 13 Apr 2023 17:02:35 -0500
Message-Id: <20230413220241.1396012-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <c2iRJbyvGnN.A._5F.dwHOkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2422
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230413220241.1396012-1-eblake@redhat.com
Resent-Date: Thu, 13 Apr 2023 22:03:09 +0000 (UTC)

v2 was here:
https://lists.debian.org/nbd/2022/11/msg00030.html
The bulk of the changes since then are:
 - forbid NBD_OPT_EXPORT_NAME once extended headers are negotiated (Wouter)
 - consistently use 'maximum payload', rather than a haphazard mix of
   'maximum block payload' (Vladimir)

At this point, I want to make sure we are happy with the spec before
re-posting patches for qemu and libnbd (there were some slight tweaks
to the spec compared to v2, which will be easy enough to code, but I
want to make sure there won't be any other tweaks needed based on
review comments to this proposal).

I could still be persuaded that if extended headers are negotiated,
then the server should ONLY send back 64-bit block status replies (as
written here, and as I implemented in v2 patches for qemu and libnbd,
I specified that the server can choose either 32- or 64-bit replies,
based on what fits best, and regardless of whether the client made a
request with effect length less than 32 bits; clients must therefore
be prepared to handle both types of replies).

I'm still not sure whether patch 6 is desirable; it didn't get any
feedback in my v2 posting.

In relation to v2, the subject line for patch 2 changed (the 'git
backport-diff' tool doesn't handle that well), and the interdiff
changes look bigger than they really are due to reflowed paragraphs.

[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/6:[----] [-C] 'spec: Recommend cap on NBD_REPLY_TYPE_BLOCK_STATUS length'
002/6:[down] 'spec: Change maximum block size to maximum payload size'
003/6:[0237] [FC] 'spec: Add NBD_OPT_EXTENDED_HEADERS'
004/6:[----] [-C] 'spec: Allow 64-bit block status results'
005/6:[----] [-C] 'spec: Introduce NBD_FLAG_BLOCK_STATUS_PAYLOAD'
006/6:[0062] [FC] 'RFC: spec: Introduce NBD_REPLY_TYPE_OFFSET_HOLE_EXT'

Eric Blake (6):
  spec: Recommend cap on NBD_REPLY_TYPE_BLOCK_STATUS length
  spec: Change maximum block size to maximum payload size
  spec: Add NBD_OPT_EXTENDED_HEADERS
  spec: Allow 64-bit block status results
  spec: Introduce NBD_FLAG_BLOCK_STATUS_PAYLOAD
  RFC: spec: Introduce NBD_REPLY_TYPE_OFFSET_HOLE_EXT

 doc/proto.md | 738 ++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 549 insertions(+), 189 deletions(-)


base-commit: fd2c5a60e36ef0ea0d7fd6f8a6bd908d24d5801d
-- 
2.39.2


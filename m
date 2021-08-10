Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFED3E829E
	for <lists+nbd@lfdr.de>; Tue, 10 Aug 2021 20:15:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5704120339; Tue, 10 Aug 2021 18:15:44 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug 10 18:15:44 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	URIBL_RED autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D03692032E
	for <lists-other-nbd@bendel.debian.org>; Tue, 10 Aug 2021 18:15:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.254 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001, URIBL_RED=0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lvrzzM9jtm4a for <lists-other-nbd@bendel.debian.org>;
	Tue, 10 Aug 2021 18:15:30 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 376 seconds by postgrey-1.36 at bendel; Tue, 10 Aug 2021 18:15:30 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id B45FD2032D
	for <nbd@other.debian.org>; Tue, 10 Aug 2021 18:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628619325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H+p706fUXqoCZSKkiwPODnUrUwI7grJne+xYhm9OJUI=;
	b=d6sq4/JEIu9fupiUKnFiMJva98X23w9iJg3wx6Jgko1LsKGN6xjdB+WJRibhDsewNivdau
	w6nnh0QX7wkADibCjMCXGb3Ss4MUs+5L4AJejJbDoh3DXbnSxf/x3CMlTq92Ix50acRDa9
	jfLCwd0g76gwjVtF7RTa4jCIG8Ywke4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-1MiYP5QuNjmMN2bVTWLXpg-1; Tue, 10 Aug 2021 14:09:04 -0400
X-MC-Unique: 1MiYP5QuNjmMN2bVTWLXpg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 150E8107B7C3;
	Tue, 10 Aug 2021 18:09:04 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD98326DFD;
	Tue, 10 Aug 2021 18:08:59 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH] docs: Link to protocol security considerations in uri docs
Date: Tue, 10 Aug 2021 13:08:59 -0500
Message-Id: <20210810180859.2100611-1-eblake@redhat.com>
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
Resent-Message-ID: <GsrdhoW6lRF.A.dAH.QJsEhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1263
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210810180859.2100611-1-eblake@redhat.com
Resent-Date: Tue, 10 Aug 2021 18:15:44 +0000 (UTC)

Especially useful in light of the recent publishing of
https://nostarttls.secvuln.info/, which documents a variety of
implementations vulnerable to downgrade attacks in SMTP and IMAP, as
well as its caution that that any protocol with a STARTTLS operation
(which includes NBD) needs to be aware of the potential downgrade
attacks.

The NBD protocol documentation already covers what is necessary to
avoid the effects of a downgrade attack, and all known implementations
of NBD servers and clients with working NBD_OPT_STARTTLS have at least
one mode where TLS is mandatory rather than opportunistic.  So I don't
see this as a CVE against the NBD protocol itself, so much as a worry
about the potential for future poor implementations that disregard the
documentation.
---

I'm likely to push this to the NBD spec later this week if it doesn't
receive any reviews beforehand.

 doc/uri.md | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/doc/uri.md b/doc/uri.md
index 925ad4b..28aa94d 100644
--- a/doc/uri.md
+++ b/doc/uri.md
@@ -73,6 +73,12 @@ One of the following scheme names SHOULD be used to indicate an NBD URI:
 Other URI scheme names MAY be used but not all NBD clients will
 understand them or even recognize that they refer to NBD.

+Note that using opportunistically encrypted connections (via the `nbd`
+or `nbd+unix` scheme) risks a protocol downgrade attack; whereas
+requests for a secure connection (via the `nbds` or `nbds+unix`
+scheme) MUST use TLS to connect.  For more details, see
+<https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md#security-considerations>
+
 ## NBD URI authority

 The authority field SHOULD be used for TCP/IP connections and SHOULD
-- 
2.31.1


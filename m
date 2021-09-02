Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFDF3FF31C
	for <lists+nbd@lfdr.de>; Thu,  2 Sep 2021 20:18:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3E64E20790; Thu,  2 Sep 2021 18:18:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep  2 18:18:09 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4BA09205CE
	for <lists-other-nbd@bendel.debian.org>; Thu,  2 Sep 2021 18:18:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.528 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.747,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id bxC3uFtRXV61 for <lists-other-nbd@bendel.debian.org>;
	Thu,  2 Sep 2021 18:17:59 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id EE99B20503
	for <nbd@other.debian.org>; Thu,  2 Sep 2021 18:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630606674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cdzuLlEmIiMA5Gw2Eb9nXFFSFX73a5G6Tde6F6tiv5Q=;
	b=WmOzAUIkg3HyQ6AR89H5vDFKcLUD5hPRd+/gp4d9sjpHVxeUtZL9dgdFg4CY8XkwTdjWja
	JrQ9prBFKuJTb5CXjUdTIgU6kocKjTCG/cckpAM9tW/liJ1lvsviSNaes+MaOqu+66lvbE
	bA42dYh5DYOSK/2jRBH7crTmUF3a6Ic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-Nfq-aIU7N4aXDhcbZk5aLQ-1; Thu, 02 Sep 2021 14:17:47 -0400
X-MC-Unique: Nfq-aIU7N4aXDhcbZk5aLQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F4E11006C92;
	Thu,  2 Sep 2021 18:17:47 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C52126B541;
	Thu,  2 Sep 2021 18:17:46 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH] maint: Nicer warning if autoconf-archive not available
Date: Thu,  2 Sep 2021 13:17:43 -0500
Message-Id: <20210902181743.935724-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <iPTzRBwYdEL.A.JOF.hVRMhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1360
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210902181743.935724-1-eblake@redhat.com
Resent-Date: Thu,  2 Sep 2021 18:18:09 +0000 (UTC)

Prior to this patch, failure to install autoconf-archives prior to
running 'autoreconf' produces the confusing:

Makefile.am: error: Yacc source seen but 'YACC' is undefined
Makefile.am:   The usual way to define 'YACC' is to add 'AC_PROG_YACC'
Makefile.am:   to 'configure.ac' and run 'autoconf' again.

With this change, the error changes to:

configure.ac:117: error: possibly undefined macro: AX_PROG_BISON
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.

which is still not a direct finger pointing to missing
autoconf-archives, but at least provides more relevant hits in a
google search for how to resolve it (compared to recommended remedies
for the first message).

Reported-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 configure.ac | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure.ac b/configure.ac
index c71e7c7..48ba507 100644
--- a/configure.ac
+++ b/configure.ac
@@ -107,6 +107,10 @@ AC_ARG_ENABLE(
   [ENABLE_GZNBD=no]
 )

+dnl We require autoconf-archive to be installed. Warn about undefined macros
+dnl with a uniform message if autoconf could not find those macros.
+m4_pattern_forbid([^AX_])
+
 AC_PROG_CC_C99
 AC_PROG_CPP
 AC_PROG_INSTALL
-- 
2.31.1


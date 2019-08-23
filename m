Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2589B240
	for <lists+nbd@lfdr.de>; Fri, 23 Aug 2019 16:38:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C6E32204F3; Fri, 23 Aug 2019 14:38:52 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 23 14:38:52 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 85043204EF
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Aug 2019 14:38:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uR6qKpUgPW2C for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Aug 2019 14:38:43 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 105F220384
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 14:38:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBC71309175F;
	Fri, 23 Aug 2019 14:38:39 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89B0260605;
	Fri, 23 Aug 2019 14:38:37 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH 0/1] libnbd support for new fast zero
Date: Fri, 23 Aug 2019 09:38:35 -0500
Message-Id: <20190823143836.27321-1-eblake@redhat.com>
In-Reply-To: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Fri, 23 Aug 2019 14:38:40 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xGHCsUlk5CB.A.MoC.8p_XdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/639
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190823143836.27321-1-eblake@redhat.com
Resent-Date: Fri, 23 Aug 2019 14:38:52 +0000 (UTC)

See the cross-post cover letter for details:
https://www.redhat.com/archives/libguestfs/2019-August/msg00322.html

Eric Blake (1):
  api: Add support for FAST_ZERO flag

 lib/nbd-protocol.h     |  2 ++
 generator/generator    | 29 +++++++++++++++++++++++------
 lib/flags.c            | 12 ++++++++++++
 lib/protocol.c         |  1 +
 lib/rw.c               |  9 ++++++++-
 tests/Makefile.am      | 20 ++++++++++++++++++++
 tests/eflags-plugin.sh |  5 +++++
 7 files changed, 71 insertions(+), 7 deletions(-)

-- 
2.21.0


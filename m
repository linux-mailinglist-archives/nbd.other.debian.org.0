Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 985F810B68
	for <lists+nbd@lfdr.de>; Wed,  1 May 2019 18:35:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 733C720350; Wed,  1 May 2019 16:35:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May  1 16:35:06 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8CFFD2034A
	for <lists-other-nbd@bendel.debian.org>; Wed,  1 May 2019 16:34:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id yIln9H_sfkEZ for <lists-other-nbd@bendel.debian.org>;
	Wed,  1 May 2019 16:34:55 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8D47B20347
	for <nbd@other.debian.org>; Wed,  1 May 2019 16:34:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F25033082E44
	for <nbd@other.debian.org>; Wed,  1 May 2019 16:34:51 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-15.phx2.redhat.com [10.3.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B47A86B572
	for <nbd@other.debian.org>; Wed,  1 May 2019 16:34:51 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Subject: [PATCH 0/2] Error-related doc tweaks
Date: Wed,  1 May 2019 11:34:49 -0500
Message-Id: <20190501163451.15506-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 01 May 2019 16:34:52 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GU-m7Kba82B.A.P0.6qcycB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/486
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190501163451.15506-1-eblake@redhat.com
Resent-Date: Wed,  1 May 2019 16:35:06 +0000 (UTC)

I'll probably push these this weekend if they don't get any review
(sooner if there is positive review).

Eric Blake (2):
  doc: Clarify use of EOVERFLOW
  doc: Tweak naming of NBD errors

 doc/proto.md | 65 +++++++++++++++++++++++++++-------------------------
 1 file changed, 34 insertions(+), 31 deletions(-)

-- 
2.20.1


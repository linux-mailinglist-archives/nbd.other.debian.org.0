Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B2454E008
	for <lists+nbd@lfdr.de>; Thu, 16 Jun 2022 13:30:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D7E6820585; Thu, 16 Jun 2022 11:30:07 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 16 11:30:07 2022
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4CE6C20580
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Jun 2022 11:29:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.337 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.147, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id oaYPKHrIaqFY for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Jun 2022 11:29:54 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 0ADFD20579
	for <nbd@other.debian.org>; Thu, 16 Jun 2022 11:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655378989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JNtdB+KBzs+64ZX/E9ULikncLkmRftnZ+s0YOMHSsLQ=;
	b=cvij475qj8H1YMIAm2PS+Lkz7z/XASO43haZYZFf3Q1Hdeq1vFrGeVBeClGyClJpeOoTlk
	anFJNZW/5L2NQibz8BYmWdSOWSifRP0CVEqeYb24aQLNIZniMyaGDdAP7FEXTIFPV8LnuP
	SOV3q0B2BH1g5teopNNKWAcIW8OQPkE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-3SnvrmilOPmACSwsZw3uGg-1; Thu, 16 Jun 2022 07:29:46 -0400
X-MC-Unique: 3SnvrmilOPmACSwsZw3uGg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C58A3296A600;
	Thu, 16 Jun 2022 11:29:45 +0000 (UTC)
Received: from pick.home.annexia.org (unknown [10.39.192.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7290C492CA6;
	Thu, 16 Jun 2022 11:29:44 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: josef@toxicpanda.com
Cc: axboe@kernel.dk,
	prasanna.kalever@redhat.com,
	xiubli@redhat.com,
	ming.lei@redhat.com,
	nbd@other.debian.org,
	eblake@redhat.com
Subject: [PATCH nbd-client] client: Request NBD_INFO_BLOCK_SIZE and set constraints in the kernel
Date: Thu, 16 Jun 2022 12:29:41 +0100
Message-Id: <20220616112942.3222708-1-rjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2WVDJvH8BoG.A.W0H._QxqiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2145
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220616112942.3222708-1-rjones@redhat.com
Resent-Date: Thu, 16 Jun 2022 11:30:07 +0000 (UTC)

This is the smallest change needed to allow NBD servers to specify a
preferred block size, and reflect that in
/sys/devices/virtual/block/nbd0/queue/minimum_io_size /
/sys/devices/virtual/block/nbd0/queue/optimal_io_size.

Notes:

 - Requires the associated kernel patch.

 - We should probably remove the -b option, allowing the NBD server to
   set this instead (via the minimum block size setting).  However as
   that is a major change, I did not do it here.

 - Absolutely no checking is done that the preferred block size makes
   sense.  The server can send anything and it'll be reflected in
   those files.  Is this bad?  Possibly.  We should probably at least
   sanity check the value (eg. is it a power of 2, is it in the range
   block size .. 32M).  Should we do other checks?

 - I only bothered changing the netlink interface, not the ioctl
   interface, as it is my understanding (maybe not correct?) that the
   ioctl interface is deprecated.

Rich.



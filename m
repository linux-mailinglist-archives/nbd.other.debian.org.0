Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDA454DFF5
	for <lists+nbd@lfdr.de>; Thu, 16 Jun 2022 13:25:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8894A20579; Thu, 16 Jun 2022 11:25:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 16 11:25:13 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 9111220573
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Jun 2022 11:25:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.337 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.147, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YHXjGrC00s5T for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Jun 2022 11:25:00 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id BD9762056D
	for <nbd@other.debian.org>; Thu, 16 Jun 2022 11:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655378695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YNFibKj3gf/eijxgCi7qw0c7bBrSPK5mswMMdYMTenE=;
	b=dgWKbmDp3cq0djcCBpQZkETpOq6VhBjcfnYeP4vv3so6v7sTyaMRikiyVlWkUGaF8qSIBd
	6JV/hxIBQe4Yl7UaUDgVvSNJWrHjQqRic1wcjrJgwgUYRhQvbjAGgvQmme9fBH1gobwUI3
	mXaq0xJng5p9gUz4/pK0etw/cmhPb9k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-r82OFgTuOuWWwMFtiqJihg-1; Thu, 16 Jun 2022 07:24:52 -0400
X-MC-Unique: r82OFgTuOuWWwMFtiqJihg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AF5C95B48A;
	Thu, 16 Jun 2022 11:24:52 +0000 (UTC)
Received: from pick.home.annexia.org (unknown [10.39.192.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 95D3F1121314;
	Thu, 16 Jun 2022 11:24:50 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: josef@toxicpanda.com
Cc: axboe@kernel.dk,
	prasanna.kalever@redhat.com,
	xiubli@redhat.com,
	ming.lei@redhat.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	eblake@redhat.com
Subject: [PATCH] nbd: Permit nbd-client to set minimum and optimal I/O sizes
Date: Thu, 16 Jun 2022 12:24:48 +0100
Message-Id: <20220616112449.3222664-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <OryNN2_WKUE.A.KSF.ZMxqiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2143
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220616112449.3222664-1-rjones@redhat.com
Resent-Date: Thu, 16 Jun 2022 11:25:13 +0000 (UTC)

This is a small change to the nbd kernel driver which allows the
client to set minimum_io_size and optimal_io_size hints for the NBD
device.

There is an accompanying patch for nbd-client (userspace tool) which I
will send separately.

Rich.



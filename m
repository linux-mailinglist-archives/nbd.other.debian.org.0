Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F0699405EBB
	for <lists+nbd@lfdr.de>; Thu,  9 Sep 2021 23:24:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 67118206E6; Thu,  9 Sep 2021 21:24:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep  9 21:24:09 2021
Old-Return-Path: <0101017bcc59313d-955db194-7795-4a37-9f04-cd914e230cad-000000@us-west-2.amazonses.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RERE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 917A5206E4
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Sep 2021 21:06:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.672 tagged_above=-10000 required=5.3
	tests=[BAYES_05=-1.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	HTML_MESSAGE=2, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, RERE=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vhm9xOcW-J8P for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Sep 2021 21:06:42 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 595 seconds by postgrey-1.36 at bendel; Thu, 09 Sep 2021 21:06:42 UTC
Received: from a27-205.smtp-out.us-west-2.amazonses.com (a27-205.smtp-out.us-west-2.amazonses.com [54.240.27.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 947D9206E2
	for <nbd@other.debian.org>; Thu,  9 Sep 2021 21:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1631221002;
	h=From:Date:Subject:Message-Id:To:Cc:MIME-Version:Content-Type:Feedback-ID;
	bh=xRYP7AJ+WYRf2U1ItH+D+F7O1j/1n0rXd1wKxE3ByBg=;
	b=JrsnwJs5aim1xuX2570vwB3CCMFLdQ8Y0O0rG9U3wT8q+qm7rbEhhlHcoYvw49Sy
	3N4cVtd0j0etElQXFy1zUKd5JSlGVjsfYOORmDOfxUro7v2kmKu9fINlLoolTWUzlbf
	EWVsbXpRhHMlW2n5Dlbq/+RgXGJqpxR7mhius+4s=
From: ticketsupport@incontactemail.com
Date: Thu, 9 Sep 2021 20:56:42 +0000
Subject: RE: Re: [PATCH v4 6/6] nbd: don't start request if nbd_queue_rq()
 failed
Message-ID: <0101017bcc59313d-955db194-7795-4a37-9f04-cd914e230cad-000000@us-west-2.amazonses.com>
To: hch@infradead.org, yukuai3@huawei.com
Cc: axboe@kernel.dk, josef@toxicpanda.com, ming.lei@redhat.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 nbd@other.debian.org, yi.zhang@huawei.com
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary=part_8bac16fc_deed_4c83_adc7_7623b77ea99b
Feedback-ID: 1.us-west-2.xgvvsEBmNFCPGQycQIp2ohiutGFA7Wl3Wx4Y99itgcM=:AmazonSES
X-SES-Outgoing: 2021.09.09-54.240.27.205
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <eSM6ltMWNHE.A.V1E.5tnOhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1431
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/0101017bcc59313d-955db194-7795-4a37-9f04-cd914e230cad-000000@us-west-2.amazonses.com
Resent-Date: Thu,  9 Sep 2021 21:24:09 +0000 (UTC)

--part_8bac16fc_deed_4c83_adc7_7623b77ea99b
Content-Type: text/plain; charset=utf-8

<div>thanks&nbsp;<br /><hr />From: hch@infradead.org <br />Sent: Thu Sep 09 2021 02:41:53 GMT-0400 (Bolivia Time) <br />To: yukuai3@huawei.com <br />Subject: Re: [PATCH v4 6/6] nbd: don't start request if nbd_queue_rq() failed </div>
Looks good,<br /><br />Reviewed-by: Christoph Hellwig &lt;hch@lst.de&gt;<br /><br />&lt;/hch@lst.de&gt;
--part_8bac16fc_deed_4c83_adc7_7623b77ea99b
Content-Type: text/html; charset=utf-8
Content-Id: <F3LV3W4IQEU4.ZVUFI09STYPW@send-email-api>

<div>thanks&nbsp;<br /><hr />From: hch@infradead.org <br />Sent: Thu Sep 09 2021 02:41:53 GMT-0400 (Bolivia Time) <br />To: yukuai3@huawei.com <br />Subject: Re: [PATCH v4 6/6] nbd: don't start request if nbd_queue_rq() failed </div>
Looks good,<br /><br />Reviewed-by: Christoph Hellwig &lt;hch@lst.de&gt;<br /><br />&lt;/hch@lst.de&gt;
--part_8bac16fc_deed_4c83_adc7_7623b77ea99b--


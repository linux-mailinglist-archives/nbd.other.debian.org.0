Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FFFC44BD7
	for <lists+nbd@lfdr.de>; Mon, 10 Nov 2025 02:39:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 523262074C; Mon, 10 Nov 2025 01:39:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 10 01:39:12 2025
Old-Return-Path: <prvs=3409a38527=lizhi.xu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 68E842074C
	for <lists-other-nbd@bendel.debian.org>; Mon, 10 Nov 2025 01:23:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.104 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ufZzTP36ZV6G for <lists-other-nbd@bendel.debian.org>;
	Mon, 10 Nov 2025 01:23:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 1673 seconds by postgrey-1.36 at bendel; Mon, 10 Nov 2025 01:23:40 UTC
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.pphosted.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0B30C20745
	for <nbd@other.debian.org>; Mon, 10 Nov 2025 01:23:39 +0000 (UTC)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA0ekG71370625;
	Mon, 10 Nov 2025 00:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=JaISnBIM8TtljMNWVb/twSAW6Y6xm947zv6CbOja+2o=; b=
	aPbUkQnLVuUoo1LVNhJHl0fF0EBxy+C1n+EPCACuRy80CfhAnwMVjP9ZfKZgeUHV
	3xLXR2uyN0BA23FCZkg8WOEHpeM4xlo7zcNY8RruBZETOV9fsjdET6Xy/nptkFgG
	2hdtAPUK/5ZUbG5mzNM5P/8eaQFGhxdIxBu0a+Gu4rWsNWoHbW6FPa0mp8zSElQU
	U1+ftF3kPWcz6YhZVarJ24ePJp5Yp4YtlZnXXMrabt4cbm3M/ipuaHoVIIVZOL0V
	Kub07IBWSrEgnmHCweC5xawm2DQGcC43BgZMqhRZVh9pvb+CSIXG2Ac4+CbMDYw7
	z/+2lEUgj6XY1tYjruq70g==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9vu91bwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 10 Nov 2025 00:54:58 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 9 Nov 2025 16:54:57 -0800
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 9 Nov 2025 16:54:54 -0800
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <zhengqixing@huaweicloud.com>
CC: <axboe@kernel.dk>, <houtao1@huawei.com>, <josef@toxicpanda.com>,
        <linan122@h-partners.com>, <linux-block@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <nbd@other.debian.org>,
        <xiubli@redhat.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>,
        <zhengqixing@huawei.com>
Subject: Re: [PATCH] nbd: defer config put in recv_work
Date: Mon, 10 Nov 2025 08:54:53 +0800
Message-ID: <20251110005453.546675-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251108070202.1816004-1-zhengqixing@huaweicloud.com>
References: <20251108070202.1816004-1-zhengqixing@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDAwNiBTYWx0ZWRfX/TgGF60eeaXw
 MrnP5oJFFqzkUvNbboqLP1LICi4dA1cvT3RcPcTysr894ZhvUuJV/jK2pI26JwffPkVX9G+tJ3V
 qi/FopDjWXvbPjajOyDFTyrEI4eF0ENFh+6E3qxBjRqjJEoBJ+WjahHfelZxcAQj+GhbZ1OLahU
 UvBETBoJv1Lj5HAKhYC0k9SQGg1M/LbKtXkmZArUfP/10L3ewa75nLEGkaxaQ+3HYa6+AWgK0fb
 Gptio3kNRyiLrCvd9o3pV4F9JZEC7v6owVvVdhm0i0Fu4y8/KtdHbxnJPs1jxJ8bOBkVukMHl2/
 057cgJbayVjIVPs3qgfTSxNLzswYLtu/bqG0FPAfSvaRhDIuvSMT7FQzCXDODetxnxyyekvH2Br
 +ducexkh5NwYdFys09M/rr2Ixq2ZPg==
X-Proofpoint-GUID: _1d-Iv7cGR3fWwKlZx5NWUZ9KEM7Tn79
X-Proofpoint-ORIG-GUID: _1d-Iv7cGR3fWwKlZx5NWUZ9KEM7Tn79
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=691137e2 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=i0EeH86SAAAA:8 a=zsVopKiV-EVrbT5phREA:9
 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22 a=cPQSjfK2_nFv0Q5t_7PE:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=SsAZrZ5W_gNWK9tOzrEV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_10,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1011
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100006
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <l9asaFDzXrF.A.7__.AJUEpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3468
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20251110005453.546675-1-lizhi.xu@windriver.com
Resent-Date: Mon, 10 Nov 2025 01:39:12 +0000 (UTC)

On Sat,  8 Nov 2025 15:02:02 +0800, Zheng Qixing wrote:
> Reported-by: syzbot+56fbf4c7ddf65e95c7cc@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6907edce.a70a0220.37351b.0014.GAE@google.com/T/
> Fixes: 87aac3a80af5 ("nbd: make the config put is called before the notifying the waiter")
> Depends-on: e2daec488c57 ("nbd: Fix hungtask when nbd_config_put")
> Signed-off-by: Zheng Qixing <zhengqixing@huawei.com>
> ---
>  drivers/block/nbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index a853c65ac65d..215fc18115b7 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1024,9 +1024,9 @@ static void recv_work(struct work_struct *work)
>  	nbd_mark_nsock_dead(nbd, nsock, 1);
>  	mutex_unlock(&nsock->tx_lock);
> 
> -	nbd_config_put(nbd);
>  	atomic_dec(&config->recv_threads);
>  	wake_up(&config->recv_wq);
> +	nbd_config_put(nbd);
>  	kfree(args);
>  }
This only makes the problem more hidden, and that's far from enough.
I tested the same patch on syzbot on October 3rd before you did; you
can check it out here [1].

[1] https://syzkaller.appspot.com/bug?extid=56fbf4c7ddf65e95c7cc


Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8576915143F
	for <lists+nbd@lfdr.de>; Tue,  4 Feb 2020 03:45:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 58896206A1; Tue,  4 Feb 2020 02:45:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb  4 02:45:06 2020
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	FVGT_m_MULTI_ODD,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9046F206A0
	for <lists-other-nbd@bendel.debian.org>; Tue,  4 Feb 2020 02:29:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.26 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FVGT_m_MULTI_ODD=0.02,
	MIME_CHARSET_FARAWAY=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8fv0Xh8JpvJh for <lists-other-nbd@bendel.debian.org>;
	Tue,  4 Feb 2020 02:29:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL_SUBNET=-1.2 (check from: .huawei. - helo: .huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -4.7
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5407D2069E
	for <nbd@other.debian.org>; Tue,  4 Feb 2020 02:29:04 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id BDF6794BC6A9C7913AE0;
	Tue,  4 Feb 2020 10:28:55 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.66) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 4 Feb 2020
 10:28:54 +0800
Subject: Re: [v2] nbd: add a flush_workqueue in nbd_start_device
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <mchristi@redhat.com>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>
References: <20200122031857.5859-1-sunke32@huawei.com>
From: "sunke (E)" <sunke32@huawei.com>
Message-ID: <aaa74a5a-3213-7b97-7cc4-89686d985ff2@huawei.com>
Date: Tue, 4 Feb 2020 10:28:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200122031857.5859-1-sunke32@huawei.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.222.66]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <PozUi3lMVZJ.A.HcB.yqNOeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/787
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/aaa74a5a-3213-7b97-7cc4-89686d985ff2@huawei.com
Resent-Date: Tue,  4 Feb 2020 02:45:06 +0000 (UTC)

ping

ÔÚ 2020/1/22 11:18, Sun Ke Ð´µÀ:
> When kzalloc fail, may cause trying to destroy the
> workqueue from inside the workqueue.
> 
> If num_connections is m (2 < m), and NO.1 ~ NO.n
> (1 < n < m) kzalloc are successful. The NO.(n + 1)
> failed. Then, nbd_start_device will return ENOMEM
> to nbd_start_device_ioctl, and nbd_start_device_ioctl
> will return immediately without running flush_workqueue.
> However, we still have n recv threads. If nbd_release
> run first, recv threads may have to drop the last
> config_refs and try to destroy the workqueue from
> inside the workqueue.
> 
> To fix it, add a flush_workqueue in nbd_start_device.
> 
> Fixes: e9e006f5fcf2 ("nbd: fix max number of supported devs")
> Signed-off-by: Sun Ke <sunke32@huawei.com>
> ---
>   drivers/block/nbd.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index b4607dd96185..78181908f0df 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1265,6 +1265,16 @@ static int nbd_start_device(struct nbd_device *nbd)
>   		args = kzalloc(sizeof(*args), GFP_KERNEL);
>   		if (!args) {
>   			sock_shutdown(nbd);
> +			/*
> +			 * If num_connections is m (2 < m),
> +			 * and NO.1 ~ NO.n(1 < n < m) kzallocs are successful.
> +			 * But NO.(n + 1) failed. We still have n recv threads.
> +			 * So, add flush_workqueue here to prevent recv threads
> +			 * dropping the last config_refs and trying to destroy
> +			 * the workqueue from inside the workqueue.
> +			 */
> +			if (i)
> +				flush_workqueue(nbd->recv_workq);
>   			return -ENOMEM;
>   		}
>   		sk_set_memalloc(config->socks[i]->sock->sk);
> 


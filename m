Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B77A15813D
	for <lists+nbd@lfdr.de>; Mon, 10 Feb 2020 18:21:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6C21120510; Mon, 10 Feb 2020 17:21:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 10 17:21:22 2020
Old-Return-Path: <mchristi@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E70E8204FF
	for <lists-other-nbd@bendel.debian.org>; Mon, 10 Feb 2020 17:05:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.081 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LCup8_9etf2Y for <lists-other-nbd@bendel.debian.org>;
	Mon, 10 Feb 2020 17:05:53 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by bendel.debian.org (Postfix) with ESMTP id 95EEB20419
	for <nbd@other.debian.org>; Mon, 10 Feb 2020 17:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581354347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mrFG4yx5KHZJPEp8JCGY2d7GTCuNuHloXmrmr/9oJ2w=;
	b=RMH2oZSofDznns3mJUm/BoO6Jbh/ussjHw/U/rW/lH76pbrMC2v6xvwS0kZTvdpcotIcbx
	6QeEdbWWuU4Qb2MpHNHqcGtgwHRgNiNv1300N42Qn2/HVRoX7Gmh1qPbmz6xGZCy/zoB/B
	1TcCp4eKKe1Dn+nTNWVGp90INJDTTN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-ig_F83XcMheKg367QqKYBw-1; Mon, 10 Feb 2020 12:05:41 -0500
X-MC-Unique: ig_F83XcMheKg367QqKYBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23FB18017DF;
	Mon, 10 Feb 2020 17:05:40 +0000 (UTC)
Received: from [10.10.123.157] (ovpn-123-157.rdu2.redhat.com [10.10.123.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC3B15C108;
	Mon, 10 Feb 2020 17:05:38 +0000 (UTC)
Subject: Re: [v3] nbd: fix potential NULL pointer fault in nbd_genl_disconnect
To: Sun Ke <sunke32@huawei.com>, josef@toxicpanda.com, axboe@kernel.dk
References: <20200210073241.41813-1-sunke32@huawei.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
From: Mike Christie <mchristi@redhat.com>
Message-ID: <5E418D62.8090102@redhat.com>
Date: Mon, 10 Feb 2020 11:05:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20200210073241.41813-1-sunke32@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qjRvkCWBxxG.A.LmD.SEZQeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/806
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5E418D62.8090102@redhat.com
Resent-Date: Mon, 10 Feb 2020 17:21:22 +0000 (UTC)

On 02/10/2020 01:32 AM, Sun Ke wrote:
> Open /dev/nbdX first, the config_refs will be 1 and
> the pointers in nbd_device are still null. Disconnect
> /dev/nbdX, then reference a null recv_workq. The
> protection by config_refs in nbd_genl_disconnect is useless.
> 
> To fix it, just add a check for a non null task_recv in
> nbd_genl_disconnect.
> 
> Signed-off-by: Sun Ke <sunke32@huawei.com>
> ---
> v1 -> v2:
> Add an omitted mutex_unlock.
> 
> v2 -> v3:
> Add nbd->config_lock, suggested by Josef.
> ---
>  drivers/block/nbd.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index b4607dd96185..870b3fd0c101 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -2008,12 +2008,20 @@ static int nbd_genl_disconnect(struct sk_buff *skb, struct genl_info *info)
>  		       index);
>  		return -EINVAL;
>  	}
> +	mutex_lock(&nbd->config_lock);
>  	if (!refcount_inc_not_zero(&nbd->refs)) {
> +		mutex_unlock(&nbd->config_lock);
>  		mutex_unlock(&nbd_index_mutex);
>  		printk(KERN_ERR "nbd: device at index %d is going down\n",
>  		       index);
>  		return -EINVAL;
>  	}
> +	if (!nbd->recv_workq) {
> +		mutex_unlock(&nbd->config_lock);
> +		mutex_unlock(&nbd_index_mutex);
> +		return -EINVAL;
> +	}
> +	mutex_unlock(&nbd->config_lock);
>  	mutex_unlock(&nbd_index_mutex);
>  	if (!refcount_inc_not_zero(&nbd->config_refs)) {
>  		nbd_put(nbd);
>

With my other patch then we will not need this right? It handles your
case by just being integrated with the existing checks in:

nbd_disconnect_and_put->nbd_clear_sock->sock_shutdown

...

static void sock_shutdown(struct nbd_device *nbd)
{

....

        if (config->num_connections == 0)
                return;


num_connections is zero for your case since we never did a
nbd_genl_disconnect so we would return here.


Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A612E51D
	for <lists+nbd@lfdr.de>; Wed, 29 May 2019 21:12:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6B9AF2072D; Wed, 29 May 2019 19:12:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 29 19:12:08 2019
Old-Return-Path: <mchristi@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B2601206CE
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 May 2019 18:55:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 89dVt2UjCyxT for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 May 2019 18:55:34 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 83368206CC
	for <nbd@other.debian.org>; Wed, 29 May 2019 18:55:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 498013097031;
	Wed, 29 May 2019 18:55:24 +0000 (UTC)
Received: from [10.10.122.41] (ovpn-122-41.rdu2.redhat.com [10.10.122.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4EAB861B9B;
	Wed, 29 May 2019 18:55:21 +0000 (UTC)
Subject: Re: [PATCH] nbd: fix crash when the blksize is zero
To: xiubli@redhat.com, josef@toxicpanda.com, axboe@kernel.dk,
 nbd@other.debian.org
References: <20190527054438.13548-1-xiubli@redhat.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 atumball@redhat.com
From: Mike Christie <mchristi@redhat.com>
Message-ID: <5CEED598.7080703@redhat.com>
Date: Wed, 29 May 2019 13:55:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20190527054438.13548-1-xiubli@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 29 May 2019 18:55:24 +0000 (UTC)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <MPYbixBobHC.A.KyC.Imt7cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/552
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5CEED598.7080703@redhat.com
Resent-Date: Wed, 29 May 2019 19:12:08 +0000 (UTC)

On 05/27/2019 12:44 AM, xiubli@redhat.com wrote:
> From: Xiubo Li <xiubli@redhat.com>
> 
> This will allow the blksize to be set zero and then use 1024 as
> default.
> 
> Signed-off-by: Xiubo Li <xiubli@redhat.com>
> ---
>  drivers/block/nbd.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 053958a..4c1de1c 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -135,6 +135,8 @@ struct nbd_cmd {
>  
>  #define NBD_MAGIC 0x68797548
>  
> +#define NBD_DEF_BLKSIZE 1024
> +
>  static unsigned int nbds_max = 16;
>  static int max_part = 16;
>  static struct workqueue_struct *recv_workqueue;
> @@ -1237,6 +1239,14 @@ static void nbd_clear_sock_ioctl(struct nbd_device *nbd,
>  		nbd_config_put(nbd);
>  }
>  
> +static bool nbd_is_valid_blksize(unsigned long blksize)
> +{
> +	if (!blksize || !is_power_of_2(blksize) || blksize < 512 ||
> +		blksize > PAGE_SIZE)
> +		return false;
> +	return true;
> +}
> +
>  /* Must be called with config_lock held */
>  static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
>  		       unsigned int cmd, unsigned long arg)
> @@ -1252,8 +1262,9 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
>  	case NBD_SET_SOCK:
>  		return nbd_add_socket(nbd, arg, false);
>  	case NBD_SET_BLKSIZE:
> -		if (!arg || !is_power_of_2(arg) || arg < 512 ||
> -		    arg > PAGE_SIZE)
> +		if (!arg)
> +			arg = NBD_DEF_BLKSIZE;
> +		if (!nbd_is_valid_blksize(arg))
>  			return -EINVAL;
>  		nbd_size_set(nbd, arg,
>  			     div_s64(config->bytesize, arg));
> @@ -1333,7 +1344,7 @@ static struct nbd_config *nbd_alloc_config(void)
>  	atomic_set(&config->recv_threads, 0);
>  	init_waitqueue_head(&config->recv_wq);
>  	init_waitqueue_head(&config->conn_wait);
> -	config->blksize = 1024;
> +	config->blksize = NBD_DEF_BLKSIZE;
>  	atomic_set(&config->live_connections, 0);
>  	try_module_get(THIS_MODULE);
>  	return config;
> @@ -1769,6 +1780,10 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
>  	if (info->attrs[NBD_ATTR_BLOCK_SIZE_BYTES]) {
>  		u64 bsize =
>  			nla_get_u64(info->attrs[NBD_ATTR_BLOCK_SIZE_BYTES]);
> +		if (!bsize)
> +			bsize = NBD_DEF_BLKSIZE;
> +		if (!nbd_is_valid_blksize(bsize))
> +			return -EINVAL;

You can't only return here. You need to also drop the mutex, do
nbd_put, and drop config_refs reference.

Maybe you want to move this check to the beginning of the function with
the NBD_ATTR_SIZE_BYTES sanity check since the error handling is easier
there.


>  		nbd_size_set(nbd, bsize, div64_u64(config->bytesize, bsize));
>  	}
>  	if (info->attrs[NBD_ATTR_TIMEOUT]) {
> 


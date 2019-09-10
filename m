Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E36A3AEA06
	for <lists+nbd@lfdr.de>; Tue, 10 Sep 2019 14:09:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B3CF3205BD; Tue, 10 Sep 2019 12:09:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 10 12:09:08 2019
Old-Return-Path: <mkubecek@suse.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=DIGITS_LETTERS,FOURLA,GMAIL,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6702E205AA
	for <lists-other-nbd@bendel.debian.org>; Tue, 10 Sep 2019 11:53:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, GMAIL=1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id h9lebKTAPy4i for <lists-other-nbd@bendel.debian.org>;
	Tue, 10 Sep 2019 11:53:47 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 1101 seconds by postgrey-1.36 at bendel; Tue, 10 Sep 2019 11:53:47 UTC
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.suse.de", Issuer "DigiCert SHA2 High Assurance Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 81FC5205A6
	for <nbd@other.debian.org>; Tue, 10 Sep 2019 11:53:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id D3D19B6C1;
	Tue, 10 Sep 2019 11:35:21 +0000 (UTC)
Received: by unicorn.suse.cz (Postfix, from userid 1000)
	id 133D9E03B1; Tue, 10 Sep 2019 13:35:21 +0200 (CEST)
Date: Tue, 10 Sep 2019 13:35:21 +0200
From: Michal Kubecek <mkubecek@suse.cz>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Cc: josef@toxicpanda.com, kjlu@umn.edu, smccaman@umn.edu,
	secalert@redhat.com, emamd001@umn.edu, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nbd_genl_status: null check for nla_nest_start
Message-ID: <20190910113521.GA9895@unicorn.suse.cz>
References: <20190729130912.7imtg3hfnvb4lt2y@MacBook-Pro-91.local>
 <20190729164226.22632-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190729164226.22632-1-navid.emamdoost@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EedeU2bkLVH.A.sqG.kJ5ddB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/688
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190910113521.GA9895@unicorn.suse.cz
Resent-Date: Tue, 10 Sep 2019 12:09:08 +0000 (UTC)

(Just stumbled upon this patch when link to it came with a CVE bug report.)

On Mon, Jul 29, 2019 at 11:42:26AM -0500, Navid Emamdoost wrote:
> nla_nest_start may fail and return NULL. The check is inserted, and
> errno is selected based on other call sites within the same source code.
> Update: removed extra new line.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> Reviewed-by: Bob Liu <bob.liu@oracle.com>
> ---
>  drivers/block/nbd.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 9bcde2325893..2410812d1e82 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -2149,6 +2149,11 @@ static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info)
>  	}
>  
>  	dev_list = nla_nest_start_noflag(reply, NBD_ATTR_DEVICE_LIST);
> +	if (!dev_list) {
> +		ret = -EMSGSIZE;
> +		goto out;
> +	}
> +
>  	if (index == -1) {
>  		ret = idr_for_each(&nbd_index_idr, &status_cb, reply);
>  		if (ret) {

You should also call nlmsg_free(reply) when you bail out so that you
don't introduce a memory leak.

Michal Kubecek


Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3BD20C8FB
	for <lists+nbd@lfdr.de>; Sun, 28 Jun 2020 18:21:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2FBCB2036C; Sun, 28 Jun 2020 16:21:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jun 28 16:21:20 2020
Old-Return-Path: <ebiggers@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MD5_SHA1_SUM,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B3CF82036A
	for <lists-other-nbd@bendel.debian.org>; Sun, 28 Jun 2020 16:05:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.081 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zt5mSFJFCzJV for <lists-other-nbd@bendel.debian.org>;
	Sun, 28 Jun 2020 16:05:19 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 387 seconds by postgrey-1.36 at bendel; Sun, 28 Jun 2020 16:05:18 UTC
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D4CAA20340
	for <nbd@other.debian.org>; Sun, 28 Jun 2020 16:05:18 +0000 (UTC)
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net [107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E207B2071A;
	Sun, 28 Jun 2020 15:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593359927;
	bh=TABu29BI2c2+MRgRU1Lp6FgWpAUZToEc49ZuYWCqrwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O2VVzPPuS4p+UcSYmiyCkYc3MuRC/eV0+XGU3zj9Oy0Z5QZZ8nKO9SMZRuThM2ho3
	 V7UduENIdaHhvg/HRkpUL/8SKz4HVUM+dnZ06VXaDQR+OI1k7sIgG3exEfYTFfZxHB
	 JPxCeEiqUYsMECWRPKNaXVM/fEZh44dOXH+oX13g=
Date: Sun, 28 Jun 2020 08:58:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
Cc: Zheng Bin <zhengbin13@huawei.com>,
	"josef@toxicpanda.com" <josef@toxicpanda.com>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"nbd@other.debian.org" <nbd@other.debian.org>,
	"yi.zhang@huawei.com" <yi.zhang@huawei.com>
Subject: Re: [PATCH] nbd: Fix memory leak in nbd_add_socket
Message-ID: <20200628155845.GB2310@sol.localdomain>
References: <20200612090437.77977-1-zhengbin13@huawei.com>
 <BYAPR04MB4965BCC5D59A22A417274A5486920@BYAPR04MB4965.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR04MB4965BCC5D59A22A417274A5486920@BYAPR04MB4965.namprd04.prod.outlook.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rmiCv9dhT8N.A.sDF.AOM-eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/911
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200628155845.GB2310@sol.localdomain
Resent-Date: Sun, 28 Jun 2020 16:21:20 +0000 (UTC)

On Thu, Jun 25, 2020 at 12:16:33AM +0000, Chaitanya Kulkarni wrote:
> On 6/12/20 1:57 AM, Zheng Bin wrote:
> > nbd_add_socket
> >    socks = krealloc(num_connections+1) -->if num_connections is 0, alloc 1
> >    nsock = kzalloc                     -->If fail, will return
> > 
> > nbd_config_put
> >    if (config->num_connections)        -->0, not free
> >      kfree(config->socks)
> > 
> > Thus memleak happens, this patch fixes that.
> > 
> > Signed-off-by: Zheng Bin<zhengbin13@huawei.com>

This appears to address the syzbot report "memory leak in nbd_add_socket"
https://syzkaller.appspot.com/bug?id=08283193956ab772623e65242b3ed6d0e7c7d9ce
Can you please add:

	Reported-by: syzbot+934037347002901b8d2a@syzkaller.appspotmail.com

> 
> Not an nbd expert but wouldn't it be easier use following which matches 
> the + 1 in the nbd_add_socket() :-
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 01794cd2b6ca..e67c790039c9 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1209,9 +1209,9 @@ static void nbd_config_put(struct nbd_device *nbd)
>                          device_remove_file(disk_to_dev(nbd->disk), 
> &pid_attr);
>                  nbd->task_recv = NULL;
>                  nbd_clear_sock(nbd);
> -               if (config->num_connections) {
> +               if (config->num_connections + 1) {
>                          int i;
> -                       for (i = 0; i < config->num_connections; i++) {
> +                       for (i = 0; i < (config->num_connections + 1); 
> i++) {
>                                  sockfd_put(config->socks[i]->sock);
>                                  kfree(config->socks[i]);
>                          }

That looks wrong.  The + 1 is just nbd_add_socket() preparing to append an entry
to the array.

Why not just check whether the pointer is NULL or not:

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 43cff01a5a67..cb8e86174edb 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1206,7 +1206,7 @@ static void nbd_config_put(struct nbd_device *nbd)
 			device_remove_file(disk_to_dev(nbd->disk), &pid_attr);
 		nbd->task_recv = NULL;
 		nbd_clear_sock(nbd);
-		if (config->num_connections) {
+		if (config->socks) {
 			int i;
 			for (i = 0; i < config->num_connections; i++) {
 				sockfd_put(config->socks[i]->sock);


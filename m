Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B74578CCF
	for <lists+nbd@lfdr.de>; Mon, 29 Jul 2019 15:27:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5FC4820508; Mon, 29 Jul 2019 13:27:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul 29 13:27:08 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VERIFIED,FOURLA,GMAIL,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7AB9520515
	for <lists-other-nbd@bendel.debian.org>; Mon, 29 Jul 2019 13:09:26 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.12 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, GMAIL=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id o_H08KJChW-6 for <lists-other-nbd@bendel.debian.org>;
	Mon, 29 Jul 2019 13:09:22 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x842.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 55AB720356
	for <nbd@other.debian.org>; Mon, 29 Jul 2019 13:09:18 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d17so59445896qtj.8
        for <nbd@other.debian.org>; Mon, 29 Jul 2019 06:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gmqmelot7c8TsfxfK8guHC1YaaOzW0NDY2AOV3Nd6Yw=;
        b=1mF386Irha74xgp2n02mxpH5+sB7AkZ9W6c14hyts/wM/W8HyaR2OODlAK6tRTnBhf
         T1FasDPLMMA7tV3KsxMPdmVTwP8nlr4RRn53kiDWsWqsp989a8dw4g1XyOR15oPDlRuL
         iDbqrvc9wUDu9/VjhjJxwamDQ5+7g7oKDkpXQO6gQhPf4L1cvdQ78pecEvK2416q2nJl
         slp+tPAkDp7/RjgIyK6xhKvIBYupGFCKWd+DAYyc2Zrh7eRmnymmO6HrXDtbq0xC02mL
         f3AxOVSQ05CMFEFropuyWaeOhFHzBe7EIP23/Itd2PtcLzNK7hftL6NUHrFuurq0ohYt
         bEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gmqmelot7c8TsfxfK8guHC1YaaOzW0NDY2AOV3Nd6Yw=;
        b=DoYJTD/kjVCW7EgWSaGST/PY2ishqvCRvDlxwPKucwKBx8qksTX4zVQL885LgFM9G2
         OLdqA8I98pxneyGchdGFR4y0uk7i/reNUwWM5dTl9WBDTMiYe0/SVzUKwMmkicwplhEW
         ZVLrCYb722+/Pe4n8h5fccY4rdmQriSlG8500aplO4+UXwxMmBgSoY4JL/wdwJn5ti0P
         bOlbR91j4pkDDtLLzU3+HVngE2Pr5/UVhR7W0EB67xLVd7HVRhKCmiOdbswc4hQrCZBy
         XlUyD0CfBSLNM2hfUnrhr3niYtGLWQMq8bu1EQrqj4eDut4Iv8avZsfpuK1KZqYEQJLJ
         hIfA==
X-Gm-Message-State: APjAAAVAP7fhJwzWElKD7ybJzcSy8rWP+9DG6wfYjVB5y3INy2KkcRXd
	GpSrhWt63rtVEZucZj0LrfQ=
X-Google-Smtp-Source: APXvYqxlf9wa1ZONBy8deTWyxx+xNxslPUXKiAkpwGKjeNbSTvSXqtOMFg1q+0qPHgK/kJcWqoYSfA==
X-Received: by 2002:a0c:8a76:: with SMTP id 51mr80122616qvu.210.1564405755580;
        Mon, 29 Jul 2019 06:09:15 -0700 (PDT)
Received: from localhost ([107.15.81.208])
        by smtp.gmail.com with ESMTPSA id t6sm27462939qkh.129.2019.07.29.06.09.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 06:09:14 -0700 (PDT)
Date: Mon, 29 Jul 2019 09:09:13 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Cc: emamd001@umn.edu, kjlu@umn.edu, smccaman@umn.edu, secalert@redhat.com,
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nbd_genl_status: null check for nla_nest_start
Message-ID: <20190729130912.7imtg3hfnvb4lt2y@MacBook-Pro-91.local>
References: <20190723230157.14484-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723230157.14484-1-navid.emamdoost@gmail.com>
User-Agent: NeoMutt/20180716
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6BXI3GsthMN.A.JIC.sQvPdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/604
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190729130912.7imtg3hfnvb4lt2y@MacBook-Pro-91.local
Resent-Date: Mon, 29 Jul 2019 13:27:08 +0000 (UTC)

On Tue, Jul 23, 2019 at 06:01:57PM -0500, Navid Emamdoost wrote:
> nla_nest_start may fail and return NULL. The check is inserted, and
> errno is selected based on other call sites within the same source code.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
>  drivers/block/nbd.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 9bcde2325893..dba362de4d91 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -2149,6 +2149,12 @@ static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info)
>  	}
>  
>  	dev_list = nla_nest_start_noflag(reply, NBD_ATTR_DEVICE_LIST);
> +

No newline here, once you fix that nit you can add

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef


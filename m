Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8101059E6
	for <lists+nbd@lfdr.de>; Thu, 21 Nov 2019 19:48:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BDA1D20494; Thu, 21 Nov 2019 18:48:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Nov 21 18:48:08 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VERIFIED,GMAIL,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DE3552037D
	for <lists-other-nbd@bendel.debian.org>; Thu, 21 Nov 2019 18:30:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, GMAIL=1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3h95lqnbTu2g for <lists-other-nbd@bendel.debian.org>;
	Thu, 21 Nov 2019 18:30:24 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x743.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7720120397
	for <nbd@other.debian.org>; Thu, 21 Nov 2019 18:30:23 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id q70so3900373qke.12
        for <nbd@other.debian.org>; Thu, 21 Nov 2019 10:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KIV6C8dEDRsWYAQ2tTt3LiUnyRDtIsvpcdrWmt9koPk=;
        b=GKNVzz82IHSesvkhRwLOrdR1guhy1ks2Zlv5Ig9t4AOGgFyjYCJJLijnX+MsFowaXV
         RsyaqXjmaAhEKGmtYxEH+iPKkLHXHFpTuRz1wKvwFc70VrQxaOGVXyBOhjWMJ0JMhJfB
         8v+EDESV8ao55NbiACdWSRh4IaD2WVhHfWfoBmYoqyjjdN56d6gqKA7Cu41Pm+WwmeDB
         tyO7+rhHbotOPjRQIwIj/EKC9fMRPXOZ6XbEU38Q4t5aqxY1CA+7/LlSoWUbFjfiiLLT
         reR0lZBlCbK1tCyqtsYZVzBMydx8fC7iTyCWACTRNYORaRYTgseS+RgEGgiaHgUtbuc8
         240g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KIV6C8dEDRsWYAQ2tTt3LiUnyRDtIsvpcdrWmt9koPk=;
        b=WeHOuZPPdmpELkdCvq22jYgP+N/I5YERQI04AL/ZdUmeNP2bHsO0I8n5g0d0VBpJO/
         h6IWOx25B+67VUrV7e9wiLlqXdNHb/VwPiBHHRC19DIBR7pikQFROEpmKfreX2j1WWlM
         kFWkRQlonkyEodmAi0aLpLqwLofyfXW7691/KU1ka1fe3Mlg5DLkcQu8GjT91xZ+NRLz
         YHA9McGBu4sLUho6zeZb066qq6qie2DTsGSWMdKRt0oD46cJWVYtLEcdV6igqgjYMF+U
         9Iexk6WaDR35bilKkm93mSYevbjLek8Ipu9llestuZ70mYLUMycFZPErF9QYVBkGu9uT
         aHsA==
X-Gm-Message-State: APjAAAXnQpgRTTAnbDd1L3tStEZbPMhoWipShmYyXfrrPX5a5TMNL1SP
	GKWR2eO0D/qI8kuMDnc1rp2YhQ==
X-Google-Smtp-Source: APXvYqyaGMwQheyrHGh2wyVCXUzgK0AD9nF7B5VCw+XZF6QwzxAqrPIjnl8qwfQqMknP9QjM9fRjDA==
X-Received: by 2002:a37:78f:: with SMTP id 137mr8854398qkh.321.1574361020373;
        Thu, 21 Nov 2019 10:30:20 -0800 (PST)
Received: from localhost ([107.15.81.208])
        by smtp.gmail.com with ESMTPSA id g17sm2036642qte.89.2019.11.21.10.30.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Nov 2019 10:30:19 -0800 (PST)
Date: Thu, 21 Nov 2019 13:30:17 -0500
From: Josef Bacik <josef@toxicpanda.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Cc: emamd001@umn.edu, smccaman@umn.edu, kjlu@umn.edu,
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nbd: prevent memory leak
Message-ID: <20191121183017.h3qkpib5re27ty3b@MacBook-Pro-91.local>
References: <20190923200959.29643-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923200959.29643-1-navid.emamdoost@gmail.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <RzHGWxmwafK.A.pLF.ovt1dB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/746
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191121183017.h3qkpib5re27ty3b@MacBook-Pro-91.local
Resent-Date: Thu, 21 Nov 2019 18:48:08 +0000 (UTC)

On Mon, Sep 23, 2019 at 03:09:58PM -0500, Navid Emamdoost wrote:
> In nbd_add_socket when krealloc succeeds, if nsock's allocation fail the
> reallocted memory is leak. The correct behaviour should be assigning the
> reallocted memory to config->socks right after success.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef


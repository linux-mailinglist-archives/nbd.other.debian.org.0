Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF3F2CD4B
	for <lists+nbd@lfdr.de>; Tue, 28 May 2019 19:12:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9CA08205CD; Tue, 28 May 2019 17:12:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 28 17:12:08 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VERIFIED,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5465820477
	for <lists-other-nbd@bendel.debian.org>; Tue, 28 May 2019 16:54:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Bi_Sy6tYyEXD for <lists-other-nbd@bendel.debian.org>;
	Tue, 28 May 2019 16:54:30 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-vs1-xe44.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 59F2920489
	for <nbd@other.debian.org>; Tue, 28 May 2019 16:54:29 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id x8so606015vsx.13
        for <nbd@other.debian.org>; Tue, 28 May 2019 09:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HQt9C+mDH/TUYn5kg6jHMMxiwsbiOA+Z5/e525L3AMA=;
        b=uzWeB+uGT3cAPGvt3ADTuyydh02gLjz+m42TrKNuu1mZ1XPtAAgf+ygS4izSAfMYso
         W/Zg+95lTcBcr0PNRoeVVxeZUU5CVuqpjygraX8eNiqPjzXwhQgf4VnAgw89sB3Si+jG
         9rwcfY4d8v6APQDB7tDD+TEGPBKBvXlN2PXrLHOZskAXc1VWyWJdIg6K24A9VjC08QD8
         FUiqa3dFymS6kadeHhfhd9hyRe7emM2wO179JH17TY4M9oOHCgnz22Zoc6Lnooxqnx66
         RadD87A/8ZoeYU4AejspEwfkEJrTgE1rO9/xe54mmpYbXb9l3FEJfHGs8nbWueLyT6d/
         KfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HQt9C+mDH/TUYn5kg6jHMMxiwsbiOA+Z5/e525L3AMA=;
        b=cvvDgaGuA9PN4sq5Vi0Bl+DGHPbcq3nA6aAQ+RoBl6+RctzpbVj9cQl/CdvksaCKPU
         vArcOVB6GZbVhxodZ6S+R1hfhVrlWkHScn58mx6EQ1R179snc4YQUa6MlNLlEt/qeRAQ
         4RA9b83OXPFozB/zAhir1qR85whULltEQo2eGx+vWCgaI54rJ7GC+KAkfj270ErbRlTI
         lYoG2AzCiq7BphNWuPCkLNJJ/NdkvGRGTXe4Xj0ZVxbyqcrY+wFns7BKhCj8xEKTiLdL
         6/hNCpMGFlEz8Bl3i58fpAs0995h6Ox9oY2LhUTN8+LFmDo7/DL639xclWC0pjjprXhI
         aO1Q==
X-Gm-Message-State: APjAAAWBWZD2qMSlueiJXDQwJ80BJxm5QnsXs0v/W4MiMvLCWRECobtK
	yKjRfTy7cFZXK4lt6CxEamxXrw==
X-Google-Smtp-Source: APXvYqwdJmGwGTLqzuJ7olkBPW5dFT/6v5cSbIfig8dbCcNljaCg8IpJEPeP1RBcQYr4sbUkhsNNLw==
X-Received: by 2002:a67:3052:: with SMTP id w79mr57705721vsw.68.1559062466594;
        Tue, 28 May 2019 09:54:26 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::6684])
        by smtp.gmail.com with ESMTPSA id e76sm16361362vke.54.2019.05.28.09.54.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 09:54:25 -0700 (PDT)
Date: Tue, 28 May 2019 12:54:24 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Yao Liu <yotta.liu@ucloud.cn>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] nbd: notify userland even if nbd has already
 disconnected
Message-ID: <20190528165422.bi27p6czm477bxsg@MacBook-Pro-91.local>
References: <1558691036-16281-1-git-send-email-yotta.liu@ucloud.cn>
 <1558691036-16281-2-git-send-email-yotta.liu@ucloud.cn>
 <20190524130856.zod5agp7hk74pcnr@MacBook-Pro-91.local.dhcp.thefacebook.com>
 <20190527182323.GB20702@192-168-150-246.7~>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527182323.GB20702@192-168-150-246.7~>
User-Agent: NeoMutt/20180716
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <aEomc7h3JNN.A.-0E.ovW7cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/544
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190528165422.bi27p6czm477bxsg@MacBook-Pro-91.local
Resent-Date: Tue, 28 May 2019 17:12:08 +0000 (UTC)

On Tue, May 28, 2019 at 02:23:23AM +0800, Yao Liu wrote:
> On Fri, May 24, 2019 at 09:08:58AM -0400, Josef Bacik wrote:
> > On Fri, May 24, 2019 at 05:43:55PM +0800, Yao Liu wrote:
> > > Some nbd client implementations have a userland's daemon, so we should
> > > inform client daemon to clean up and exit.
> > > 
> > > Signed-off-by: Yao Liu <yotta.liu@ucloud.cn>
> > 
> > Except the nbd_disconnected() check is for the case that the client told us
> > specifically to disconnect, so we don't want to send the notification to
> > re-connect because we've already been told we want to tear everything down.
> > Nack to this as well.  Thanks,
> > 
> > Josef
> > 
> 
> But in userland, client daemon process and process which send disconnect
> command are not same process, so they are not clear to each other, so
> client daemon expect driver inform it to exit.
> In addition, client daemon will get nbd status with nbd_genl_status interface
> after it get notified and it should not re-connect if status connected == 0

Right this is the point.  The daemon is dumb, if it gets a disconnected message
it'll try to reconnect, so we don't want to send a disconnected message if we
were specifically told to disconnect.  We don't want to rely on userspace to try
and manage this weird state machine.  If you want userland to know its time to
disconnect then have your implementation handle being told to disconnect and
handle all the things.  Thanks,

Josef


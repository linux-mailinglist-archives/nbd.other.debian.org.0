Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA1ADA3CF
	for <lists+nbd@lfdr.de>; Thu, 17 Oct 2019 04:33:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9091B20425; Thu, 17 Oct 2019 02:33:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Oct 17 02:33:09 2019
Old-Return-Path: <navid.emamdoost@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FOURLA,
	FREEMAIL_FROM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 31AF120410
	for <lists-other-nbd@bendel.debian.org>; Thu, 17 Oct 2019 02:17:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.079 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 13PbufXytVm4 for <lists-other-nbd@bendel.debian.org>;
	Thu, 17 Oct 2019 02:17:36 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id CB59120417
	for <nbd@other.debian.org>; Thu, 17 Oct 2019 02:17:35 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id n26so1029877ioj.8
        for <nbd@other.debian.org>; Wed, 16 Oct 2019 19:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AK1OtpwhD+5T5SYc4aqWUSJoX7IiVAlBKWUj0KHIhec=;
        b=uBh8gacbPpI0VJl5KhIjIShsglvHOpHqpSWiu+6AxZwpiR2br9ZYDKkGK4jzLu+SUZ
         7pgTlEXcdIACDCfz+ZcAn1V3BDOLqi6DGWoP5O2RU3WMcLv1Lh90cXa+FJJrvFJQR2aT
         bAPtAcTfnfiJL+4duRq6FOhydOf/C+oXrqvtrxoGjsvx/VtGH1nkHRyAnI3TwxWEh6ex
         ReT4YQ6smyx7AQxDNe85Egx7Ln9loTOI253cZKhTn+qZA5IW7+3rjqztC8mgvP6Rcb+y
         WLxo78bSS6cWb63/APDyM9X9QxXPq5M3bemJVqbqCvakXx23eoJQZMAe3a4aculMMmgS
         AMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AK1OtpwhD+5T5SYc4aqWUSJoX7IiVAlBKWUj0KHIhec=;
        b=fkYnQomOrtAC7LgsTAworKuCiZw31aR4nLLpbfzWQ0wqllPIRhrP0vcxjMz9pta/xp
         T8ANCRJqMmuZoMvLdi67Q4hdg+2TV0IQ/ygE9alnQWmOJTsF45UbE8aF14qbEdyqFAvW
         MWwRp4ezyhlnuwgxcjT0EU6PU2WClshU7/+6qd+GDnT3lNRAW0sNjJciQiLNGc1LzWKn
         wLdTUDEmpCJKLyXu1b5oj9CUZKS+RCh+C1ReINodrwu6LxtJd0mrUZI9kF9Fi5uD+KY/
         y2kGsqWynX1sO4srTsR62yTCL2TomkLJHlPQjZWhz9s4mcRpBG9VbU+t5SGoGtqw2iEu
         QXgQ==
X-Gm-Message-State: APjAAAX9sBOgS+7klGHxCYulFHmmfgDsAoLbhgzpPLy5+UGILVEvT4EH
	wL+U/JbO0uCiel4DyrFjXCUwDIuXLGXZz3shZco=
X-Google-Smtp-Source: APXvYqxULrKgQ13wwrDcc/ZVRpDzrh5ucuhgVylaQdb5YcGidUlTidsU1sTS0PxjOuF31m58p9CFtoXVTVngUlEoyDs=
X-Received: by 2002:a02:a11e:: with SMTP id f30mr1061524jag.95.1571278652391;
 Wed, 16 Oct 2019 19:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190729130912.7imtg3hfnvb4lt2y@MacBook-Pro-91.local>
 <20190729164226.22632-1-navid.emamdoost@gmail.com> <20190910113521.GA9895@unicorn.suse.cz>
In-Reply-To: <20190910113521.GA9895@unicorn.suse.cz>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Wed, 16 Oct 2019 21:17:21 -0500
Message-ID: <CAEkB2ES8rc4kkPwA+okfMa9CpFoDqmt=tx8H8vHZKBCfw9L_tg@mail.gmail.com>
Subject: Re: [PATCH v2] nbd_genl_status: null check for nla_nest_start
To: Michal Kubecek <mkubecek@suse.cz>
Cc: Josef Bacik <josef@toxicpanda.com>, Kangjie Lu <kjlu@umn.edu>, 
	Stephen McCamant <smccaman@umn.edu>, secalert@redhat.com, Navid Emamdoost <emamd001@umn.edu>, 
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <yvK2mR7lrgF.A.lAH.lL9pdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/705
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAEkB2ES8rc4kkPwA+okfMa9CpFoDqmt=tx8H8vHZKBCfw9L_tg@mail.gmail.com
Resent-Date: Thu, 17 Oct 2019 02:33:09 +0000 (UTC)

Hi Michal, please check v3 at https://lore.kernel.org/patchwork/patch/1126650/


Thanks,
Navid.

On Tue, Sep 10, 2019 at 6:35 AM Michal Kubecek <mkubecek@suse.cz> wrote:
>
> (Just stumbled upon this patch when link to it came with a CVE bug report.)
>
> On Mon, Jul 29, 2019 at 11:42:26AM -0500, Navid Emamdoost wrote:
> > nla_nest_start may fail and return NULL. The check is inserted, and
> > errno is selected based on other call sites within the same source code.
> > Update: removed extra new line.
> >
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> > Reviewed-by: Bob Liu <bob.liu@oracle.com>
> > ---
> >  drivers/block/nbd.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > index 9bcde2325893..2410812d1e82 100644
> > --- a/drivers/block/nbd.c
> > +++ b/drivers/block/nbd.c
> > @@ -2149,6 +2149,11 @@ static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info)
> >       }
> >
> >       dev_list = nla_nest_start_noflag(reply, NBD_ATTR_DEVICE_LIST);
> > +     if (!dev_list) {
> > +             ret = -EMSGSIZE;
> > +             goto out;
> > +     }
> > +
> >       if (index == -1) {
> >               ret = idr_for_each(&nbd_index_idr, &status_cb, reply);
> >               if (ret) {
>
> You should also call nlmsg_free(reply) when you bail out so that you
> don't introduce a memory leak.
>
> Michal Kubecek



-- 
Navid.


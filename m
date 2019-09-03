Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 84475A76AA
	for <lists+nbd@lfdr.de>; Wed,  4 Sep 2019 00:03:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 56AC82025D; Tue,  3 Sep 2019 22:03:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  3 22:03:20 2019
Old-Return-Path: <taylor4869@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3E10A201DC
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Sep 2019 21:48:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.949 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HZPPHJodFBse for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Sep 2019 21:48:07 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-yw1-xc32.google.com (mail-yw1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E85102019B
	for <nbd@other.debian.org>; Tue,  3 Sep 2019 21:48:06 +0000 (UTC)
Received: by mail-yw1-xc32.google.com with SMTP id i207so6472061ywc.9
        for <nbd@other.debian.org>; Tue, 03 Sep 2019 14:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mMAwxjKQu+JSwPe2gzleSRJQSocED1Fv1b9sK+wAI9Y=;
        b=lzp+yplvJV8MgWW2xpw6QiMzgCDu3HDDHKO1Uyqe6Q9j+2FLKSrtyWQTxHCUU7E1+e
         h91r7+SjpDrFTTKAi+Oi9j0WRXbi7EKcLSPzjTrcDDXjpFmGwWRAe/nNjG9eYQmvwDBo
         M7bqSJWyJzM3ZmzZEy7TeVd3w/Qc22I7xHQWvH2biXeW2GC5txd6weZcqCu8lPnAL4Xp
         exUfxrnz8Z30a+4Te29d5wzoPqDE7psdlVZ5jZjC7aIyOr3KucG67EpaZ4tfVI6sZcPz
         gvXvkLxZm9fancO9ckL+c5Doft1yHGadEXrL0NZnLJKxqX3gdaOHBnedG5q4MfP6xETL
         z7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mMAwxjKQu+JSwPe2gzleSRJQSocED1Fv1b9sK+wAI9Y=;
        b=Z5kCsg1AhvUV9p+LqeXhPdt5Z//JHbBoHY7H9+B/IyBzFQa3R7mj8yIWiMVgnESzgf
         +k6AxDlF2krzLji+JvOYskbyJuB2HIT4Qns9qYSbT+IbubOhLrhQELsr54ZN3qzQTOtH
         PYa89x0c0e1xM8BmaJieKW52YQ3kH6phnjLvWII/OpHoNObxrRB61xT5GzgzJYF4JYpw
         8j6U6s7sAJ9IJQX2y6TbJ8wElTc+wgXaonyOXn2io3/pJRn2sPaMdpuE5aVabORYufwz
         loZrXaCDAngIgAkNHzpoBEtPZQ7/8Qjo6rN5tPeDxJQy25gPy4eotjVZMkqchi5Z3vz3
         HyFA==
X-Gm-Message-State: APjAAAWsAlUZHVcXkuNOa6xNahWmTR/NisT0zL2VXwHpDjJG3q9IOBKL
	JljUjsDn6vFF3Cy3KpPstO/eDUXBsbq8wLm7id4=
X-Google-Smtp-Source: APXvYqzxVTpLGWbl0jHy6NW107KNS7aXnJqoAbkOHpDcd+95inmC3pRRkG1A91Z3jZjIKfCf15YndjmQKi4qw9S9QiQ=
X-Received: by 2002:a81:4c55:: with SMTP id z82mr25361810ywa.367.1567547283440;
 Tue, 03 Sep 2019 14:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAKiK_mD-sk_RqO_gtCL0-aeayZZ1miZ1LvBNGDhRB6ft+810bw@mail.gmail.com>
 <20190902214851.GA25667@redhat.com>
In-Reply-To: <20190902214851.GA25667@redhat.com>
From: Taylor Yang <taylor4869@gmail.com>
Date: Tue, 3 Sep 2019 14:47:52 -0700
Message-ID: <CAKiK_mA3c=5z+coCQrwfLnaudgrVTgKUMjN6sQWaL5_ffgNrtQ@mail.gmail.com>
Subject: Re: Question about IO workload via NBD
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Y788wanIT5M.A.D9F.oMubdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/681
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAKiK_mA3c=5z+coCQrwfLnaudgrVTgKUMjN6sQWaL5_ffgNrtQ@mail.gmail.com
Resent-Date: Tue,  3 Sep 2019 22:03:20 +0000 (UTC)

Hi Richard,

The command I use is like `fio --name=xxx --rw=randread --output=xxx
--direct=1 --ioengine=libaio --bs=16k --iodepth=4 --filename=/dev/nbd0
--size=1024Mb` and I setup both nbd client and nbd server on two
different hosts. The FIO job is executed on the nbd client side after
the connection between the nbd client and server being setup. I think
it is because nbd server uses the buffer cache but I also tried to
specify the `sync` option in the config file and it still behaves the
same way.

Any suggestion is appreciated.
Thank you!
Best wishes,
Taylor

On Mon, Sep 2, 2019 at 2:48 PM Richard W.M. Jones <rjones@redhat.com> wrote:
>
> On Fri, Aug 30, 2019 at 05:23:44PM -0700, Taylor Yang wrote:
> > Hi,
> >
> > I worked on driving IO workload using FIO to a device via NBD. There
> > seems to be some delay on the IO being shown on the original device
> > after the FIO workload completed on the NBD. Is there a delay on how
> > long the IO would be acknowledged on the original device? Is there any
> > logging information I could get to troubleshoot this issue?
> >
> > Thank you so much for your help in advance.
>
> What's the fio command line / configuration file?  Are you
> using the NBD engine or a filesystem?
>
> Rich.
>
> --
> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> virt-top is 'top' for virtual machines.  Tiny program with many
> powerful monitoring features, net stats, disk stats, logging, etc.
> http://people.redhat.com/~rjones/virt-top


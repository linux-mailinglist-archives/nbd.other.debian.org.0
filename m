Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F55EAC366
	for <lists+nbd@lfdr.de>; Sat,  7 Sep 2019 01:51:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0A8322031B; Fri,  6 Sep 2019 23:51:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Sep  6 23:51:09 2019
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
	by bendel.debian.org (Postfix) with ESMTP id 02C742039C
	for <lists-other-nbd@bendel.debian.org>; Fri,  6 Sep 2019 23:35:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.949 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jHeejFE-eiOV for <lists-other-nbd@bendel.debian.org>;
	Fri,  6 Sep 2019 23:35:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E8E822039B
	for <nbd@other.debian.org>; Fri,  6 Sep 2019 23:35:25 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id n69so2851656ywd.12
        for <nbd@other.debian.org>; Fri, 06 Sep 2019 16:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RIV/h9YUMh3IhUQfwaLXeNiGFReYiOuBVuEpESpr/HE=;
        b=hU1ZDchZWOcWRw8guMHqoBDn7p+dkwsq0dsrGvhRA6or+JOUXmiVnO/FK0UTGPb9Ye
         qLSGggY2tiYw90BOTt0Rkc91mS6/srpyIm9pJ9E8VJRbWEp60oQ2m6czBLQouDeNj+FO
         fh8+ChGTmhSQUGtrq7RJ1UA2xr/yYapfAVll+ATYf+K2D2vEgAjakv9FbgVIbdFn35f7
         Rnc66DXVdkyEgXVqpQkuWYSCrAQ9gZ7R48psenPrR4KVZk6XQHkM47sFAj5MFkgLg6BG
         uup0/EHP/CMFM8AgRlOygWQV1RZFCI/htSUMCmD5OEHTxW/zxg1acH95cciA93SbR/Wa
         PyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RIV/h9YUMh3IhUQfwaLXeNiGFReYiOuBVuEpESpr/HE=;
        b=or2GDKsGXHwjtYJOh9b23/LP/GLw0j/5UZtMkdxEaLmuaEv67F/C8glf1HhJPjRdkN
         JpDpJuNJoIJo2+Ncb8/sZIXpJ/Bc7WYhP5o6B/ZzkP/G90SDRggdgVizBMLcNKrBJIAy
         GqHG7vFI2vEx3ok0AFk3pZQy50sZMSXngxJieUZ7Rvm7/agwrOkB/AhXFVgxGFl86xpC
         xkptVuOYfb+AkVTJ1GdOqt/SzDJNAyNwpuJORyZCfUpUsmuMH4CzezTLzMslYbUYtI5t
         pMBx7oorEBxQctNJhO1h5RGIGOLO3DfrFDu8INTtzHe3J2RPEP7ffKedy2ilnagstFEk
         gHiQ==
X-Gm-Message-State: APjAAAXKGPU6fFpr6CGjmyP+2ti0llwID5POJcbEPUUKQ9TaDVKMPQxC
	U4ocUZ0hN3y2zpqg5roERrBti6DRNp7DEtVmoY4=
X-Google-Smtp-Source: APXvYqypLiapBTlKkiVEuNCh4tcU+7L2SDqB7gyCYlTSVbLA5QlcvysnNHE9ZgftsrGqfBRgPawdCkN1fsThnrvaty8=
X-Received: by 2002:a0d:e80e:: with SMTP id r14mr8674591ywe.449.1567812922282;
 Fri, 06 Sep 2019 16:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAKiK_mD-sk_RqO_gtCL0-aeayZZ1miZ1LvBNGDhRB6ft+810bw@mail.gmail.com>
 <20190902214851.GA25667@redhat.com> <CAKiK_mA3c=5z+coCQrwfLnaudgrVTgKUMjN6sQWaL5_ffgNrtQ@mail.gmail.com>
In-Reply-To: <CAKiK_mA3c=5z+coCQrwfLnaudgrVTgKUMjN6sQWaL5_ffgNrtQ@mail.gmail.com>
From: Taylor Yang <taylor4869@gmail.com>
Date: Fri, 6 Sep 2019 16:35:11 -0700
Message-ID: <CAKiK_mD-enqgQkoZ7omy1XY5N-mu=M2=CNm=STSa6VS1ue_cFQ@mail.gmail.com>
Subject: Re: Question about IO workload via NBD
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WKxDjo2KtuD.A.ufE.tDvcdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/683
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAKiK_mD-enqgQkoZ7omy1XY5N-mu=M2=CNm=STSa6VS1ue_cFQ@mail.gmail.com
Resent-Date: Fri,  6 Sep 2019 23:51:09 +0000 (UTC)

Hi All,

After specifying sync and flush error correctly, this issue seems to
be fixed. But we still encounter IO error with FIO running on NBD that
seems to cause by disconnection

The error is like
fio: io_u error on file /dev/nbd0: Input/output error: write
offset=xxxx, buflen=xxxx

I already specified 'persist' option while launching the nbd-client.
Is there any other things I could do on the NBD side or the FIO side
to prevent this error?

Any help is appreciated.

Thank you!
Best wishes,
Taylor

On Tue, Sep 3, 2019 at 2:47 PM Taylor Yang <taylor4869@gmail.com> wrote:
>
> Hi Richard,
>
> The command I use is like `fio --name=xxx --rw=randread --output=xxx
> --direct=1 --ioengine=libaio --bs=16k --iodepth=4 --filename=/dev/nbd0
> --size=1024Mb` and I setup both nbd client and nbd server on two
> different hosts. The FIO job is executed on the nbd client side after
> the connection between the nbd client and server being setup. I think
> it is because nbd server uses the buffer cache but I also tried to
> specify the `sync` option in the config file and it still behaves the
> same way.
>
> Any suggestion is appreciated.
> Thank you!
> Best wishes,
> Taylor
>
> On Mon, Sep 2, 2019 at 2:48 PM Richard W.M. Jones <rjones@redhat.com> wrote:
> >
> > On Fri, Aug 30, 2019 at 05:23:44PM -0700, Taylor Yang wrote:
> > > Hi,
> > >
> > > I worked on driving IO workload using FIO to a device via NBD. There
> > > seems to be some delay on the IO being shown on the original device
> > > after the FIO workload completed on the NBD. Is there a delay on how
> > > long the IO would be acknowledged on the original device? Is there any
> > > logging information I could get to troubleshoot this issue?
> > >
> > > Thank you so much for your help in advance.
> >
> > What's the fio command line / configuration file?  Are you
> > using the NBD engine or a filesystem?
> >
> > Rich.
> >
> > --
> > Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
> > Read my programming and virtualization blog: http://rwmj.wordpress.com
> > virt-top is 'top' for virtual machines.  Tiny program with many
> > powerful monitoring features, net stats, disk stats, logging, etc.
> > http://people.redhat.com/~rjones/virt-top


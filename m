Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9459EAC8D3
	for <lists+nbd@lfdr.de>; Sat,  7 Sep 2019 20:42:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 76A322052E; Sat,  7 Sep 2019 18:42:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Sep  7 18:42:08 2019
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
	by bendel.debian.org (Postfix) with ESMTP id 7243920514
	for <lists-other-nbd@bendel.debian.org>; Sat,  7 Sep 2019 18:26:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.949 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8SrKaEdTwRqu for <lists-other-nbd@bendel.debian.org>;
	Sat,  7 Sep 2019 18:25:58 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-yw1-xc2c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-yw1-xc2c.google.com (mail-yw1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id A38BF20513
	for <nbd@other.debian.org>; Sat,  7 Sep 2019 18:25:58 +0000 (UTC)
Received: by mail-yw1-xc2c.google.com with SMTP id x64so3442782ywg.3
        for <nbd@other.debian.org>; Sat, 07 Sep 2019 11:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2o0LNDmEGZQykHkGiPSNDbiElBHC2erclph9YoCoQbE=;
        b=c3k3S8X6eXzupfCqj7kYDcAVOoJhhs6avtWmDzm6fOCda+7FGoxIQl7kwNRoNdILTD
         KtzqZKN+RHmkPlm2krGwvlm+uceh0B1V0bx3IwjwC2iVN3V7ut4OxEPiSaBbkINV9vH/
         Xky+0E0kDaNKxZ4uuF5cH9i3rJLZvirY1mOjwRloOlpfAXhpM00MVkiJCIBGXyEnh/OL
         u8bFvlaNfCjxRaP47k8vrpyo6Hid9phEcjep57IRFCNHmNGGuXs+3wmgxU1iWvhFx+fI
         JZ/DRJsADHnnWEL0t3HWTyqm07nEktITVOqrfnMHvJGdHbLVR7Ipatn/7XPCo0opquvx
         gdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2o0LNDmEGZQykHkGiPSNDbiElBHC2erclph9YoCoQbE=;
        b=jGOoAdV2hstFPmdjy3wXgyBWHgMZcNnmbZmAJXWOzmWx89SK0DaPqrPV4bgiH7IxDc
         SXakdgo7yFY4XDaORjpwMDAvCGKVseYaRFrzlDKldLqD7NOfGfuhyALdHBt/KlLhRNO3
         4KcaVbVpHb29ccZi+hDeuLOFzOL40x87Pc21PinBKuvFqk40f8BGOMX8pVVIG9y3BwUy
         N3kP0MszHub49lb1cENCwkIWDNJK7mOws4AJrUZLKPTPeEyFMyMnVPODVvuE9WNY+xrx
         7eGpskezQSjnbY0JYOYrGsezANJFnZoO67OVbK2KmV183v+DjkL8+1Ps5XBRfE/uLiEI
         t0XA==
X-Gm-Message-State: APjAAAUsop/7DUDgG3qyWSaRw3iMTX/ocwTYlJDYwWleoD5VNUH2oGdT
	8L4hYQknw7ctKBSDN1oEVGvCwl6cu/aki57zLsM=
X-Google-Smtp-Source: APXvYqzyTiKNSMSlVAoWKY0PKy5STaiCD8k87nvHi0ZpvUvfoYmOBIVlirh5L/io0ZpBiabue/gcFVKPVGIfY+SLw/s=
X-Received: by 2002:a0d:e80e:: with SMTP id r14mr11253451ywe.449.1567880754393;
 Sat, 07 Sep 2019 11:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAKiK_mD-sk_RqO_gtCL0-aeayZZ1miZ1LvBNGDhRB6ft+810bw@mail.gmail.com>
 <20190902214851.GA25667@redhat.com> <CAKiK_mA3c=5z+coCQrwfLnaudgrVTgKUMjN6sQWaL5_ffgNrtQ@mail.gmail.com>
 <20190907134652.GB26248@grep.be>
In-Reply-To: <20190907134652.GB26248@grep.be>
From: Taylor Yang <taylor4869@gmail.com>
Date: Sat, 7 Sep 2019 11:25:41 -0700
Message-ID: <CAKiK_mDc8bEb2MewwF9D_7dCmbJorp1OUTHTrddMc_f64yMnoA@mail.gmail.com>
Subject: Re: Question about IO workload via NBD
To: Wouter Verhelst <w@uter.be>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SZTgUqt7VSE.A._UG.Ao_cdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/687
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAKiK_mDc8bEb2MewwF9D_7dCmbJorp1OUTHTrddMc_f64yMnoA@mail.gmail.com
Resent-Date: Sat,  7 Sep 2019 18:42:08 +0000 (UTC)

Yes. I enabled flush option as well. But then I figured out it is a
test setup issue. Thank you for the help!

I have another question.
I tried to reload the nbd server config file by sending SIGHUP to the
process. The client is about to setup the connection fine with the
server

sudo /usr/local/sbin/nbd-client xxxx -N test1 /dev/nbd1 -b 4096 -persist
Negotiation: ..size = 10240MB
bs=4096, sz=10737418240 bytes

But then when I tried to run FIO on that device, it complained that it
is a 0 size device.
/dev/nbd1: zero sized block device?

The nbd client syslog says

kernel: block nbd1: Connection timed out
kernel: block nbd1: shutting down sockets
kernel: print_req_error: 5 callbacks suppressed
kernel: print_req_error: I/O error, dev nbd1, sector 0

The nbd server syslog says

Connection dropped: Connection reset by peer

Is this a known issue? Is there a workaround for reloading the config
file without killing the existing connection?

I appreciate any help in advance.
Best wishes,
Taylor



On Sat, Sep 7, 2019 at 6:47 AM Wouter Verhelst <w@uter.be> wrote:
>
> On Tue, Sep 03, 2019 at 02:47:52PM -0700, Taylor Yang wrote:
> > Hi Richard,
> >
> > The command I use is like `fio --name=xxx --rw=randread --output=xxx
> > --direct=1 --ioengine=libaio --bs=16k --iodepth=4 --filename=/dev/nbd0
> > --size=1024Mb` and I setup both nbd client and nbd server on two
> > different hosts. The FIO job is executed on the nbd client side after
> > the connection between the nbd client and server being setup. I think
> > it is because nbd server uses the buffer cache but I also tried to
> > specify the `sync` option in the config file and it still behaves the
> > same way.
>
> Did you enable the flush and/or fua options?
>
> --
> To the thief who stole my anti-depressants: I hope you're happy
>
>   -- seen somewhere on the Internet on a photo of a billboard

